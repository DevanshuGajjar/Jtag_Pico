#include "hardware/dma.h"
#include "pio_jtag.h"
#include "jtag.pio.h"
#include <hardware/clocks.h>
#include "hardware/gpio.h"
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "hardware/pio.h"

static int flag =0;
static int tx_dma_chan = -1;
static int rx_dma_chan;
static dma_channel_config tx_c;
static dma_channel_config rx_c;
#define IDCODE_INST 0x04
PIO pio;
uint jtag_prog_offs ;
uint state_transition_prog_offs ;

void dma_init(){
        tx_dma_chan = dma_claim_unused_channel(true);
        tx_c = dma_channel_get_default_config(tx_dma_chan);
        channel_config_set_transfer_data_size(&tx_c, 0);
        channel_config_set_read_increment(&tx_c, true);
        channel_config_set_dreq(&tx_c, 0x0);
            dma_channel_configure(
            tx_dma_chan,
            &tx_c,
            &pio0_hw->txf[0],
            NULL,
            0,
            false
        );
        rx_dma_chan = dma_claim_unused_channel(true);
        rx_c = dma_channel_get_default_config(rx_dma_chan);
        channel_config_set_transfer_data_size(&rx_c, 0);
        channel_config_set_write_increment(&rx_c, false);
        channel_config_set_read_increment(&rx_c,false);
        channel_config_set_dreq(&rx_c, 0x4);
        dma_channel_configure(
            rx_dma_chan,
            &rx_c,
            NULL,             // Dont provide a write address yet
            &pio0_hw->rxf[0], // Read address (only need to set this once)
            0,                // Don't provide the count yet
            false             // Don't start yet
            );
}

void __time_critical_func(pio_jtag_write_blocking)(const pio_jtag_inst_t *jtag, const uint8_t *bsrc,int len,uint8_t *bdst) 
{    
    //   size_t byte_length = ((len+7) >> 3);
//        size_t tx_remain = byte_length, rx_remain = byte_length;
//        dma_init();
//        io_rw_8 *txfifo = (io_rw_8 *) &jtag->pio->txf[jtag->sm];
//        io_rw_8 *rxfifo = (io_rw_8 *) &jtag->pio->rxf[jtag->sm] + 3;
        size_t byte_length = ((len+7) >> 3);
        size_t last_shift = ((byte_length << 3) - len);
        size_t tx_remain = byte_length, rx_remain = last_shift ? byte_length : byte_length+1;
        uint8_t* rx_last_byte_p = &bdst[byte_length-1];
        io_rw_8 *txfifo = (io_rw_8 *) &jtag->pio->txf[jtag->sm];
        io_rw_8 *rxfifo = (io_rw_8 *) &jtag->pio->rxf[jtag->sm];
        // uint8_t x; // scratch local to receive data
        //kick off the process by sending the len to the tx pipeline
        *(io_rw_32*)txfifo = len-1;

       if (byte_length > 4){
        dma_init();
        channel_config_set_read_increment(&tx_c, true);
        channel_config_set_write_increment(&rx_c, true);
        dma_channel_set_config(rx_dma_chan, &rx_c, false);
        dma_channel_set_config(tx_dma_chan, &tx_c, false);
        dma_channel_transfer_to_buffer_now(rx_dma_chan, (void*)bdst,rx_remain);
        dma_channel_transfer_from_buffer_now(tx_dma_chan,(void*)bsrc, tx_remain);
        while(dma_channel_is_busy(rx_dma_chan)){
            // jtag_task();
            tight_loop_contents();
        }
        __compiler_memory_barrier();

       }
       else{
        int i=0,k=0;
            while (tx_remain || rx_remain) 
            {
                if (tx_remain && !pio_sm_is_tx_fifo_full(jtag->pio, jtag->sm))
                {
                    *txfifo = *bsrc++;
                    i++;
                    --tx_remain;
                }
                if (rx_remain && !pio_sm_is_rx_fifo_empty(jtag->pio, jtag->sm))
                {
                    bdst[k] = *rxfifo;
                    k++;
                    --rx_remain;
                }
            }
       }
    if (last_shift) 
    {
        *rx_last_byte_p = *rx_last_byte_p << last_shift;
    }

}

int __time_critical_func(pio_jtag_idcode_scan)(const pio_jtag_inst_t *jtag,uint8_t *tx_buf,float clk_div){
    int in_buff1 = 0x07;
    if(flag == 0){
      // dma_init();
      jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
      state_transition_prog_offs = pio_add_program(jtag->pio, &state_transition_program);
      flag =1;
      
    }
    pio_jtag_ir_scan(jtag ,(uint8_t*)&in_buff1 ,tx_buf,32,clk_div);
    // pio_jtag_dr_scan(jtag ,(uint8_t*)&in_buff1 ,tx_buf,32,clk_div);

    return 4;
}


int __time_critical_func(pio_jtag_reset)(const pio_jtag_inst_t *jtag,uint8_t *tx_buf,float clk_div){
    uint8_t *output_buffer = tx_buf;
    // if(flag == 0){
    //   //jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
    //   state_transition_prog_offs = pio_add_program(jtag->pio, &state_transition_program);
    //   flag =1;
    // }
    
    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs,clk_div);

    pio_sm_put_blocking(jtag->pio,0,0x6);
    pio_sm_put_blocking(jtag->pio,0,0x1F);
    char info_string[5] = "RESET";
    memcpy(output_buffer, info_string, 5);
    return 5;
}


float jtag_set_clk_freq(const pio_jtag_inst_t *jtag, uint freq_khz) {
    uint clk_sys_freq_khz = clock_get_hz(clk_sys) / 1000;
    uint32_t divider = (clk_sys_freq_khz / freq_khz) / 4;
    divider = (divider < 2) ? 2 : divider; //max reliable freq 
    return divider;
    //pio_sm_set_clkdiv_int_frac(jtag->pio, 0, 10, 0);
}



int __time_critical_func(pio_jtag_ir_scan)(const pio_jtag_inst_t *jtag, uint8_t *tx_buf, uint8_t *rx_buf,int len,float clk_div){
    // uint8_t *output_buffer = tx_buf;
    
    // if(flag == 0){
    //   // dma_init();
    //   jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
    //   state_transition_prog_offs = pio_add_program(jtag->pio, &state_transition_program);
    //   flag =1;
      
    // }
    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs,clk_div);
    pio_sm_put_blocking(jtag->pio,0,0x3);
    pio_sm_put_blocking(jtag->pio,0,0x3);
    sleep_ms(0.01);
    pio_jtag_init(jtag->pio,0,jtag_prog_offs,clk_div);
    pio_jtag_write_blocking(jtag,tx_buf,len,rx_buf);
    
    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs,clk_div);
    pio_sm_put_blocking(jtag->pio,0,0x2);
    pio_sm_put_blocking(jtag->pio,0,0x3);

    return 0;

    }


int __time_critical_func(pio_jtag_dr_scan)(const pio_jtag_inst_t *jtag, uint8_t *tx_buf, uint8_t *rx_buf,int len,float clk_div){
    // uint8_t *output_buffer = tx_buf;
    
    // if(flag == 0){
    //   // dma_init();
    //   jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
    //   state_transition_prog_offs = pio_add_program(jtag->pio, &state_transition_program);
    //   flag =1;
      
    // }
    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs,clk_div);
    pio_sm_put_blocking(jtag->pio,0,0x2);
    pio_sm_put_blocking(jtag->pio,0,0x1);
    sleep_ms(0.01);

    pio_jtag_init(jtag->pio,0,jtag_prog_offs,clk_div);
    pio_jtag_write_blocking(jtag,tx_buf ,len,rx_buf);

    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs,clk_div);
    pio_sm_put_blocking(jtag->pio,0,0x2);
    pio_sm_put_blocking(jtag->pio,0,0x3);

    return 0;


    }

