/*
  Copyright (c) 2017 Jean THOMAS.
  Copyright (c) 2020-2022 Patrick Dussud
  
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation
  the rights to use, copy, modify, merge, publish, distribute, sublicense,
  and/or sell copies of the Software, and to permit persons to whom the Software
  is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include <pico/stdlib.h>
#include <hardware/clocks.h>
#include <hardware/gpio.h>

#include "jtag.pio.h"
#include "tusb.h"
#include "pio_jtag.h"
#include "cmd.h"


enum CommandIdentifier {
  CMD_STOP = 0x00,
  CMD_INFO = 0x01,
  CMD_FREQ = 0x02,
  CMD_XFER = 0x03,
  CMD_IDCODE = 0x04,
  CMD_GETSIG = 0x05,
  CMD_CLK = 0x06,
  CMD_RESET = 0x07,
  CMD_GOTOBOOTLOADER = 0x08,
  CMD_SETVOLTAGE = 0x09
};

enum CommandModifier
{
  // CMD_XFER
  NO_READ = 0x80,
  EXTEND_LENGTH = 0x40,
  // CMD_CLK
  READOUT = 0x80,
};

enum SignalIdentifier {
  SIG_TCK = 1 << 1,
  SIG_TDI = 1 << 2,
  SIG_TDO = 1 << 3,
  SIG_TMS = 1 << 4,
  SIG_TRST = 1 << 5,
  SIG_SRST = 1 << 6
};

/**
 * @brief Handle CMD_INFO command
 *
 * CMD_INFO returns a string to the host software. This
 * could be used to check XRAYJTAG firmware version
 * or supported commands.
 *
 * @param usbd_dev USB device
 */
static uint32_t  cmd_info(uint8_t *buffer);

/**
 * @brief Handle CMD_FREQ command
 *
 * CMD_FREQ sets the clock frequency on the probe.
 * Currently this does not changes anything.
 *
 * @param commands Command data
 */
static void cmd_freq(pio_jtag_inst_t* jtag, const uint8_t *commands);
 

void cmd_handle(pio_jtag_inst_t* jtag, uint8_t* rxbuf, uint32_t count, uint8_t* tx_buf) {
  uint8_t *commands= (uint8_t*)rxbuf;
  uint8_t *output_buffer = tx_buf;
  while ((commands < (rxbuf + count)) && (*commands != CMD_STOP))
   {
    switch ((*commands)&0x0F) {
    case CMD_INFO:
    {
      gpio_init(25);
      gpio_set_dir(25, 1);
      gpio_put(25,1);
      sleep_ms(1);
      gpio_put(25,0);
      uint32_t trbytes = cmd_info(output_buffer);
      output_buffer += trbytes;
      break;
    }
    case CMD_FREQ:
      cmd_freq(jtag, commands);
      commands += 2;
      break;

    case CMD_XFER:
    {

      break;
    }
    case CMD_IDCODE:
    {
      int idcode_nu = pio_jtag_idcode_scan(jtag,output_buffer);
      output_buffer += idcode_nu;
      break;
    }
    case CMD_GETSIG:
    {

      break;
    }
    case CMD_CLK:
    {

      break;
    }
    case CMD_RESET:
    {
      int reset_nu = pio_jtag_reset(jtag,output_buffer);
      output_buffer += reset_nu;
      break;
    }
    case CMD_GOTOBOOTLOADER:

      break;
    case CMD_SETVOLTAGE:

      break;      
    default:
      return; /* Unsupported command, halt */
      break;
    }

     commands++;
   }
  /* Send the transfer response back to host */
  if (tx_buf != output_buffer)
  {
    tud_vendor_write(tx_buf, output_buffer - tx_buf);
    tud_vendor_flush();
    memset(tx_buf,0,20);
  }
  // memset(rxbuf,0,64);
  return;
}

static void cmd_freq(pio_jtag_inst_t* jtag, const uint8_t *commands) {
  jtag_set_clk_freq(jtag, (commands[1] << 8) | commands[2]);
}

static uint32_t cmd_info(uint8_t *buffer) {
  char info_string[10] = "DEVJTAG\n";
  memcpy(buffer, info_string, 10);
  return 10;
}