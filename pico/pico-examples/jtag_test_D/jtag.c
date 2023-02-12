#include "pico/stdlib.h"
#include "hardware/pio.h"

// Our assembled program:
#include "jtag.pio.h"

int main() {
    
    PIO pio = pio0;

    uint jtag_prog_offs = pio_add_program(pio, &jtag_program);
    uint ir_init_prog_offs = pio_add_program(pio, &ir_init_program);
    uint ir_deinit_prog_offs = pio_add_program(pio, &ir_deinit_program);
    pio_ir_init_init(pio,0,ir_init_prog_offs);
    pio_sm_put_blocking(pio,0,1);

    pio_jtag_init(pio,0,jtag_prog_offs);
    pio_sm_put_blocking(pio,0,0xAA);
    sleep_ms(0.001);
    pio_sm_put_blocking(pio,0,0xAA);
    sleep_ms(0.1);
    pio_ir_deinit_init(pio,0,ir_deinit_prog_offs);
    pio_sm_put_blocking(pio,0,0);

    // while(true){
    //     pio_sm_put_blocking(pio,0,0xAA);
    //     sleep_ms(10);
    //     pio_sm_put_blocking(pio,0,0x00);
    //     sleep_ms(10);
    // }

    return 0;


}

// #include <stdio.h>
// #include "pico/stdlib.h"
// #include "hardware/gpio.h"
// #include "hardware/pio.h"
// #include "jtag.pio.h"
// #include <hardware/clocks.h>
// #include "hardware/dma.h"
// //#include "jtag.h"
// #include "jtag.pio.h"

// // JTAG pins
// #define TDI 16
// #define TDO 17
// #define TCK 18
// #define TMS 19
// #define DR_SCAN 1
// #define IR_SCAN 0


// static int tx_dma_chan = -1;
// static int rx_dma_chan;
// static dma_channel_config tx_c;
// static dma_channel_config rx_c;

// typedef struct pio_jtag_inst {
//     PIO pio;
//     uint sm;
//     uint pin_tdi;
//     uint pin_tdo;
//     uint pin_tck;
//     uint pin_tms;
//     uint pin_rst;
//     uint pin_trst;
// } pio_jtag_inst_t;

// pio_jtag_inst_t assigen = {
//             .pio = pio0,
//             .sm = 0
//             };

// pio_jtag_inst_t* jtag;
// void dma_init(){
//         // Configure a channel to write a buffer to PIO0
//         // SM0's TX FIFO, paced by the data request signal from that peripheral.
//         tx_dma_chan = dma_claim_unused_channel(true);
//         tx_c = dma_channel_get_default_config(tx_dma_chan);
//         channel_config_set_transfer_data_size(&tx_c, DMA_SIZE_8);
//         channel_config_set_read_increment(&tx_c, true);
//         channel_config_set_dreq(&tx_c, DREQ_PIO0_TX0);
//             dma_channel_configure(
//             tx_dma_chan,
//             &tx_c,
//             &pio0_hw->txf[0], // Write address (only need to set this once)
//             NULL,             // Don't provide a read address yet
//             0,                // Don't provide the count yet
//             false             // Don't start yet
//         );
//         // Configure a channel to read a buffer from PIO0
//         // SM0's RX FIFO, paced by the data request signal from that peripheral.      
//         rx_dma_chan = dma_claim_unused_channel(true);
//         rx_c = dma_channel_get_default_config(rx_dma_chan);
//         channel_config_set_transfer_data_size(&rx_c, DMA_SIZE_8);
//         channel_config_set_write_increment(&rx_c, false);
//         channel_config_set_read_increment(&rx_c, false);
//         channel_config_set_dreq(&rx_c, DREQ_PIO0_RX0);
//         dma_channel_configure(
//             rx_dma_chan,
//             &rx_c,
//             NULL,             // Dont provide a write address yet
//             &pio0_hw->rxf[0], // Read address (only need to set this once)
//             0,                // Don't provide the count yet
//             false             // Don't start yet
//             );
            
           
        
//     }
    
//  //void jtag_task();
   
// void __time_critical_func(pio_jtag_write_blocking)(const pio_jtag_inst_t *jtag, const uint8_t *bsrc) 
// {
//     io_rw_8 *txfifo = (io_rw_8 *) &assigen.pio->txf[assigen.sm];
//    // io_rw_8 *rxfifo = (io_rw_8 *) &jtag->pio->rxf[jtag->sm];
//    // uint8_t x;
//         channel_config_set_read_increment(&tx_c, true);
//        // channel_config_set_write_increment(&rx_c, false );
//        // dma_channel_set_config(rx_dma_chan, &rx_c, false);
//         //dma_channel_set_config(tx_dma_chan, &tx_c, false);
//         dma_channel_transfer_from_buffer_now(tx_dma_chan, (void*)bsrc, 1);
//         //*txfifo = *bsrc;
//         //x = *rxfifo;
//     }
 
//  /*   
// void __time_critical_func(pio_jtag_read_blocking)(const pio_jtag_inst_t *jtag, const uint8_t *bsrc) 
// {
//     //io_rw_8 *txfifo = (io_rw_8 *) &assigen.pio->txf[assigen.sm];
//     io_rw_8 *rxfifo = (io_rw_8 *) &jtag->pio->rxf[jtag->sm];
//     uint8_t x;
//        // channel_config_set_read_increment(&tx_c, false);
//         channel_config_set_write_increment(&rx_c, true);
//        // dma_channel_set_config(rx_dma_chan, &rx_c, false);
//         //dma_channel_set_config(tx_dma_chan, &tx_c, false);
//        // dma_channel_transfer_from_buffer_now(tx_dma_chan, (void*)bsrc, 1);
//        dma_channel_transfer_to_buffer_now(rx_dma_chan, (void*)&x,1);
//         //*txfifo = *bsrc;
//         x = *rxfifo;
//     }
//     */
    
// int main() { 

//     dma_init();
//     // Initialize gpio 
//   //  gpio_init(TDI); 
//    // gpio_init(TMS); 
//    // gpio_set_dir(TMS, 1); 
//    // gpio_init(TCK); 
//     //gpio_init(TDO); 
    
//   // gpio_set_dir(TDI, 1); 
//   // gpio_set_dir(TCK, 1); 
//   // gpio_set_dir(TDO, 0);
//     PIO pio = pio0;
//    // PIO pio_p = pio1;

//     uint jtag_prog_offs = pio_add_program(pio, &jtag_program);
//     // uint offset = pio_add_program(pio, &jtag_t_program);
//     //uint jtag_t_prog_offs = pio_add_program(pio, &jtag_t_program);
//     pio_jtag_init(pio,0,jtag_prog_offs);
    
//     // jtag_t_program_init(pio, 1, offset, TMS);
//     //pio_jtag_t_init(pio,0,jtag_t_prog_offs);
//     // Configure JTAG pins as output 
//     uint8_t data = 0xaa;     // An int variable
//    // uint8_t* ptr = &data;
    
    
//     while(true){
//     //pio_sm_put_blocking(pio,0,0xAA);
//     //pio_sm_put_blocking(pio,0,0);
//    // gpio_put(TMS,0);
    
//      //pio_sm_put_blocking(pio, 1, 0);
//      pio_jtag_write_blocking(jtag,&data);
//      //pio_jtag_read_blocking(jtag,ptr);
//      sleep_ms(0.04282);
//     //pio_sm_put_blocking(pio,0,1);
//     //gpio_put(TMS,1);
//     //pio_sm_put_blocking(pio, 1, 0); 
//     //sleep_ms(10);
//     //pio_sm_put_blocking(pio,0,0x00);
//     sleep_ms(10);
//     }
//    // jtag_tap_close(); 

//     return 0; 

// }  

