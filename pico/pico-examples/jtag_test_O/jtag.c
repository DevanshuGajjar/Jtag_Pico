
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "jtag.pio.h"
#include <stdio.h>
#include "pico/multicore.h"
#define MULTICORE


// JTAG pins
#define TCK 1
#define TMS 3
#define TDI 11
#define TDO 12
#define DR_SCAN 1
#define IR_SCAN 0
PIO pio;
uint jtag_prog_offs ;



void jtag_tap_write_dr() { 

    uint32_t command;
    jtag_state_initialization(DR_SCAN); 


    gpio_deinit(TCK);
    pio_jtag_init(pio,0,jtag_prog_offs);
#ifdef MULTICORE
    if (multicore_fifo_rvalid())
    {

        command = multicore_fifo_pop_blocking();
        pio_sm_put_blocking(pio,0,command);
        sleep_ms(1);

    }
    else
    {
        command = multicore_fifo_pop_blocking();

    }
    
#endif
    


    gpio_init(TCK);
    gpio_set_dir(TCK,1);


    

    jtag_state_deinit(DR_SCAN); 

} 
#ifdef MULTICORE
void second_core_code()
{

	multicore_fifo_push_blocking(0xAA);
    sleep_ms(0.1);
	multicore_fifo_push_blocking(0xBB);
    sleep_ms(0.1);
	multicore_fifo_push_blocking(0xCC);
    sleep_ms(0.1);
	multicore_fifo_push_blocking(0xDD);
    sleep_ms(0.1);

}
#endif
int main() { 
#ifdef MULTICORE
	multicore_launch_core1(second_core_code);
#endif
    // Initialize gpio 
    gpio_init(TMS); 
    gpio_init(TCK); 
 
    // Configure JTAG pins as output 
    gpio_set_dir(TMS, 1); 
    gpio_set_dir(TCK, 1);

    pio = pio0;
    jtag_prog_offs = pio_add_program(pio, &jtag_program);

    while(true)
    {
       jtag_tap_write_dr(); 
    }
    return 0; 

}  

