#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "pico/multicore.h"
#include "pio_jtag.h"
// Our assembled program:
#include "jtag.pio.h"
#define MULTICORE

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
    volatile int cmd_buffer;
} buffer_info;

#define n_buffers (4)

buffer_info buffer_infos[n_buffers];

// static cmd_buffer tx_buf;

void jtag_main_task(int command,int len) //Core2
{
#ifdef MULTICORE
    if (multicore_fifo_rvalid())
    {
        //some command processing has been done
        uint rx_num = multicore_fifo_pop_blocking();
        buffer_info* bi = &buffer_infos[rx_num];
        bi->busy = false;

    }
#endif
    if ((buffer_infos[wr_buffer_number].busy == false)) 
    {
        if (true)
        {
            uint bnum = wr_buffer_number;
            uint count = len;
            if (count != 0)
            {
                buffer_infos[bnum].count = count;
                buffer_infos[bnum].busy = true;
                buffer_infos[bnum].cmd_buffer = command;
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
    uint rx_num = multicore_fifo_pop_blocking();
    buffer_info* bi = &buffer_infos[rx_num];
    assert (bi->busy); // if the structure 

    uint jtag_prog_offs = pio_add_program(jtag.pio, &jtag_program);
    uint ir_init_prog_offs = pio_add_program(jtag.pio, &ir_init_program);
    uint ir_deinit_prog_offs = pio_add_program(jtag.pio, &ir_deinit_program);

    pio_ir_init_init(jtag.pio,0,ir_init_prog_offs);
    pio_sm_put_blocking(jtag.pio,0,1);
    pio_jtag_init(jtag.pio,0,jtag_prog_offs);
    pio_jtag_write_blocking(&jtag,bi->cmd_buffer,bi->count);
    sleep_ms(0.01);
    pio_ir_deinit_init(jtag.pio,0,ir_deinit_prog_offs);
    pio_sm_put_blocking(jtag.pio,0,0);
}

int main() {
    

    int data = 0x12345678; 
    multicore_launch_core1(core1_entry);
    jtag_main_task(data,4);
    return 0;


}


