#if !defined PIO_JTAG_H
#define PIO_JTAG_H
#include "hardware/pio.h"

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
            
void pio_jtag_write_blocking(const pio_jtag_inst_t *jtag, int bsrc ,int len);

#endif
