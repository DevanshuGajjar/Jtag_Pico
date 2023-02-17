#include "hardware/dma.h"
#include "cmd.h"
#include "jtag.pio.h"
#include "hardware/pio.h"
#include <stdlib.h>
#include "pico/stdlib.h"

enum CommandIdentifier {
  CMD_STOP = 0x00,
  CMD_INFO = 0x01,
  CMD_FREQ = 0x02,
  CMD_XFER = 0x03,
  CMD_SETSIG = 0x04,
  CMD_GETSIG = 0x05,
  CMD_CLK = 0x06,
  CMD_SETVOLTAGE = 0x07,
  CMD_GOTOBOOTLOADER = 0x08
};


void cmd_handle(const pio_jtag_inst_t *jtag, int count, int tx_buf) {
  int commands= tx_buf;

    switch (commands) {
    case CMD_INFO:
    {
    uint jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
    uint ir_init_prog_offs = pio_add_program(jtag->pio, &ir_init_program);
    uint ir_deinit_prog_offs = pio_add_program(jtag->pio, &ir_deinit_program);


    pio_ir_init_init(jtag->pio,0,ir_init_prog_offs);
    pio_sm_put_blocking(jtag->pio,0,1);
    pio_jtag_init(jtag->pio,0,jtag_prog_offs);
    pio_jtag_write_blocking(jtag,tx_buf,count);
    sleep_ms(0.01);
    pio_ir_deinit_init(jtag->pio,0,ir_deinit_prog_offs);
    pio_sm_put_blocking(jtag->pio,0,0);
    
    pio_clear_instruction_memory(jtag->pio);
    sleep_ms(0.01);
    uint datareg_init_prog_offs = pio_add_program(jtag->pio, &datareg_init_program);
    uint datareg_deinit_prog_offs = pio_add_program(jtag->pio, &datareg_deinit_program);
    jtag_prog_offs = pio_add_program(jtag->pio, &jtag_program);
    tx_buf = 0x5;
    pio_datareg_init_init(jtag->pio,0,datareg_init_prog_offs);
    pio_sm_put_blocking(jtag->pio,0,1);
    pio_jtag_init(jtag->pio,0,jtag_prog_offs);
    pio_jtag_write_blocking(jtag,tx_buf,count);
    sleep_ms(0.01);
    pio_datareg_deinit_init(jtag->pio,0,datareg_deinit_prog_offs);
    pio_sm_put_blocking(jtag->pio,0,0);
   
    }
    default:
    {
      return;
      break;
    }

  }
  }
