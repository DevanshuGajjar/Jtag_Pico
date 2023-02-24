#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "pico/multicore.h"
#include "pio_jtag.h"
// Our assembled program:
#include "jtag.pio.h"
#define MULTICORE
#include <stdio.h>
#include "pico/binary_info.h"
#include "bsp/board.h"
#include "tusb.h"
#include "get_serial.h"
#include "hardware/gpio.h"
#include "cmd.h"
pio_jtag_inst_t jtag = {
            .pio = pio0,
            .sm = 0
            };


typedef uint8_t cmd_buffer[64];
static uint wr_buffer_number = 0;
// static uint rd_buffer_number = 0; 
typedef struct buffer_info
{
    volatile uint8_t count;
    volatile uint8_t busy;
    cmd_buffer buffer;
} buffer_info;

#define n_buffers (4)

buffer_info buffer_infos[n_buffers];

// static cmd_buffer tx_buf;

void jtag_main_task() //Core2
{
// #ifdef MULTICORE
//     if (multicore_fifo_rvalid())
//     {
//         //some command processing has been done
//         uint rx_num = multicore_fifo_pop_blocking();
//         buffer_info* bi = &buffer_infos[rx_num];
//         bi->busy = false;

//     }
// #endif
    if ((buffer_infos[wr_buffer_number].busy == false)) 
    {
        tud_task();// tinyusb device task
        if (tud_vendor_available())
        {
            // gpio_init(25);
            // gpio_set_dir(25, 1);
            // gpio_put(25,0);
            uint count = 0;
            count = tud_vendor_read(buffer_infos[wr_buffer_number].buffer,64);
            uint bnum = wr_buffer_number;
            if (count != 0)
            {
                // gpio_put(25,0);
                buffer_infos[bnum].count = count;
                buffer_infos[bnum].busy = true;
                wr_buffer_number = wr_buffer_number + 1; //switch buffer
                if (wr_buffer_number == n_buffers)
                {
                    wr_buffer_number = 0; 
                }
#ifdef MULTICORE
                multicore_fifo_push_blocking(bnum);
#endif
            }
        }

    }       

}


void core1_entry(){
    while(true){
    uint8_t tx_buf[20];
    uint rx_num = multicore_fifo_pop_blocking();
    buffer_info* bi = &buffer_infos[rx_num];
    assert (bi->busy); // if the structure 
    bi->busy = false;
    cmd_handle(&jtag, bi->buffer, bi->count, tx_buf);
    // memset(bi->buffer, 0, 64);
    // bi->count =0;
    // memcpy(tx_buf,0,64);
    }
}

//this is to work around the fact that tinyUSB does not handle setup request automatically
//Hence this boiler plate code
bool tud_vendor_control_xfer_cb(uint8_t rhport, uint8_t stage, tusb_control_request_t const * request)
{
    if (stage != CONTROL_STAGE_SETUP) return true;
    return false;
}

int main() {
    board_init();
    usb_serial_init();
    tusb_init();
 
    multicore_launch_core1(core1_entry);
    while(1){
    jtag_main_task();
    }
    return 0;


}


