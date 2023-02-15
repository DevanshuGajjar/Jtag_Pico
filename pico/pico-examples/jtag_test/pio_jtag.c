#include "hardware/dma.h"
#include "pio_jtag.h"
#include "jtag.pio.h"

static int tx_dma_chan = -1;
// static int rx_dma_chan;
static dma_channel_config tx_c;
// static dma_channel_config rx_c;



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