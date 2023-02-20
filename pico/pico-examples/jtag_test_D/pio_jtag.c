#include "hardware/dma.h"
#include "pio_jtag.h"
#include "jtag.pio.h"

static int tx_dma_chan = -1;
// static int rx_dma_chan;
static dma_channel_config tx_c;
// static dma_channel_config rx_c;
#define IDCODE_INST 0x04


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
      }

void __time_critical_func(pio_jtag_write_blocking)(const pio_jtag_inst_t *jtag, int bsrc,int len) 
{      int byte_length = len;
       dma_init();
       io_rw_8 *txfifo = (io_rw_8 *) &jtag->pio->txf[jtag->sm];
       channel_config_set_read_increment(&tx_c, true);     
       if (byte_length <= 4){
       dma_channel_transfer_from_buffer_now(tx_dma_chan, &bsrc, len);
       dma_channel_wait_for_finish_blocking(tx_dma_chan);
       }
       else{
        *txfifo = bsrc;
       }
}

void __time_critical_func(pio_jtag_idcode_scan)(const pio_jtag_inst_t *jtag){
    
    uint jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
    uint ir_init_prog_offs = pio_add_program(jtag->pio, &ir_init_program);
    uint ir_deinit_prog_offs = pio_add_program(jtag->pio, &ir_deinit_program);

    pio_ir_init_init(jtag->pio,0,ir_init_prog_offs);
    pio_sm_put_blocking(jtag->pio,0,1);
    pio_jtag_init(jtag->pio,0,jtag_prog_offs);  
    pio_jtag_write_blocking(jtag,IDCODE_INST,1);
    sleep_ms(0.01);
    pio_ir_deinit_init(jtag->pio,0,ir_deinit_prog_offs);
    pio_sm_put_blocking(jtag->pio,0,0);
}

void jtag_set_clk_freq(const pio_jtag_inst_t *jtag, uint freq_khz) {
    uint clk_sys_freq_khz = clock_get_hz(clk_sys) / 1000;
    uint32_t divider = (clk_sys_freq_khz / freq_khz) / 4;
    divider = (divider < 2) ? 2 : divider; //max reliable freq 
    pio_sm_set_clkdiv_int_frac(pio0, jtag->sm, divider, 0);
}