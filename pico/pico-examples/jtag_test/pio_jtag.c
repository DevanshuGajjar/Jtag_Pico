#include "hardware/dma.h"
#include "pio_jtag.h"
#include "jtag.pio.h"
#include <hardware/clocks.h>
#include "hardware/gpio.h"
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "hardware/pio.h"

int flag =0;
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
        channel_config_set_transfer_data_size(&tx_c, DMA_SIZE_8);
        channel_config_set_read_increment(&tx_c, true);
        channel_config_set_dreq(&tx_c, DREQ_PIO0_TX0);
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
        channel_config_set_transfer_data_size(&rx_c, DMA_SIZE_8);
        channel_config_set_read_increment(&rx_c,true);
        channel_config_set_dreq(&rx_c, DREQ_PIO0_RX0);
        dma_channel_configure(
            rx_dma_chan,
            &rx_c,
            NULL,             // Dont provide a write address yet
            &pio0_hw->rxf[0], // Read address (only need to set this once)
            0,                // Don't provide the count yet
            false             // Don't start yet
            );
}

void __time_critical_func(pio_jtag_write_blocking)(const pio_jtag_inst_t *jtag, int *bsrc,int len,uint8_t *bdst) 
{      int byte_length = len;
       dma_init();
       io_rw_8 *txfifo = (io_rw_8 *) &jtag->pio->txf[jtag->sm];
       //io_rw_8 *rxfifo = (io_rw_8 *) &jtag->pio->rxf[jtag->sm];
       channel_config_set_read_increment(&tx_c, true);     
       if (byte_length <= 4){
       dma_channel_transfer_from_buffer_now(tx_dma_chan,bsrc, 1);
       //dma_channel_transfer_to_buffer_now(rx_dma_chan,  bdst, len);
       dma_channel_wait_for_finish_blocking(tx_dma_chan);
      //  sleep_ms(1);
       //dma_channel_wait_for_finish_blocking(rx_dma_chan);
       }
       else{
        *txfifo = *bsrc;
       }
}

int __time_critical_func(pio_jtag_idcode_scan)(const pio_jtag_inst_t *jtag,uint8_t *output_buffer){
    int buff = IDCODE_INST;
    buff = 0xff;
    uint8_t rx_buff[10];
    gpio_init(25);
    gpio_set_dir(25, 1);
    gpio_put(25,1);
    sleep_ms(10);
    gpio_put(25,0);
    if(flag == 0){
      // dma_init();
      jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
      state_transition_prog_offs = pio_add_program(jtag->pio, &state_transition_program);
      flag =1;
      //sleep_ms(1);
    }
    

    state_transition_prog_offs = pio_add_program(jtag->pio, &state_transition_program);
    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs);

    pio_sm_put_blocking(jtag->pio,0,0x3);
    pio_sm_put_blocking(jtag->pio,0,0x3);
    sleep_ms(0.1);
    
    pio_jtag_init(jtag->pio,0,jtag_prog_offs);  
    // pio_jtag_write_blocking(jtag,&buff,1,output_buffer);
    pio_jtag_write_blocking(jtag,&buff,1,rx_buff);
    sleep_ms(1);

    pio_state_transition_init(jtag->pio,0,state_transition_prog_offs);

    pio_sm_put_blocking(jtag->pio,0,0x2);
    pio_sm_put_blocking(jtag->pio,0,0x3);
    char info_string[10] = "IDJTAG1\n";
    memcpy(output_buffer, info_string, 10);
    return 10;
}

void jtag_set_clk_freq(const pio_jtag_inst_t *jtag, uint freq_khz) {
    uint clk_sys_freq_khz = clock_get_hz(clk_sys) / 1000;
    uint32_t divider = (clk_sys_freq_khz / freq_khz) / 4;
    divider = (divider < 2) ? 2 : divider; //max reliable freq 
    pio_sm_set_clkdiv_int_frac(pio0, jtag->sm, divider, 0);
}