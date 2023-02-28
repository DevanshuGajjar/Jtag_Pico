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



int pio_jtag_dr_scan(const pio_jtag_inst_t *jtag, uint8_t *tx_buf, uint8_t *rx_buf,int len,float clk_div);

int pio_jtag_ir_scan(const pio_jtag_inst_t *jtag, uint8_t *tx_buf, uint8_t *rx_buf,int len,float clk_div);

void pio_jtag_write_blocking(const pio_jtag_inst_t *jtag, const uint8_t *bsrc,int len,uint8_t *bdst);

int pio_jtag_idcode_scan(const pio_jtag_inst_t *jtag,uint8_t *tx_buf,float clk_div);

int pio_jtag_reset(const pio_jtag_inst_t *jtag,uint8_t *tx_buf,float clk_div);

float jtag_set_clk_freq(const pio_jtag_inst_t *jtag, uint freq_khz);