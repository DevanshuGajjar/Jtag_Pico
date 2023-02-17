#if !defined CMD_H
#define CMD_H
#include "pio_jtag.h"

void cmd_handle(const pio_jtag_inst_t *jtag, int count, int tx_buf);
#endif
