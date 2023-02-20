#include "hardware/pio.h"
#include <stdlib.h>
#include "pico/stdlib.h"


typedef struct pio_jtag_inst {
    PIO pio;
    uint sm;
    uint pin_tdi;
    uint pin_tdo;
    uint pin_tck;
    uint pin_tms;
    uint pin_rst;
    uint pin_trst;
} pio_jtag_inst_t;

void pio_jtag_write_blocking(const pio_jtag_inst_t *jtag, int bsrc,int len);

void __time_critical_func(pio_jtag_idcode_scan)(const pio_jtag_inst_t *jtag);

void jtag_set_clk_freq(const pio_jtag_inst_t *jtag, uint freq_khz);