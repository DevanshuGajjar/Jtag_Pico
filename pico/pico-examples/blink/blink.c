/**
 * Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

// #include "pico/stdlib.h"
// #include <stdio.h>
// #include "hardware/gpio.h"
// #include "pico/binary_info.h"


// #define TDI_PIN 16
// #define TDO_PIN 17
// #define TCK_PIN 18
// #define TMS_PIN 19

// void jtag_init() {

//   gpio_init(TDI_PIN);
//   gpio_init(TDO_PIN);
//   gpio_init(TCK_PIN);
//   gpio_init(TMS_PIN);

//   gpio_set_dir(TCK_PIN, GPIO_OUT);
//   gpio_set_dir(TMS_PIN, GPIO_OUT);
//   gpio_set_dir(TDI_PIN, GPIO_OUT);
//   gpio_set_dir(TDO_PIN, GPIO_IN);
// }

// void jtag_shift_ir(uint8_t instruction) {
//   gpio_put(TMS_PIN, 1); // Select the instruction register
//   gpio_put(TCK_PIN, 0);
//   for (int i = 0; i < 8; i++) {
//     gpio_put(TDI_PIN, (instruction >> i) & 1); // Send the instruction bit
//     gpio_put(TCK_PIN, 1);
//     gpio_put(TCK_PIN, 0);
//   }
//   gpio_put(TMS_PIN, 0); // Exit the instruction register
//   gpio_put(TCK_PIN, 1);
//   gpio_put(TCK_PIN, 0);
// }

// uint8_t jtag_shift_dr(uint8_t data) {
//   uint8_t tdo_data = 0;
//   gpio_put(TMS_PIN, 0); // Select the data register
//   gpio_put(TCK_PIN, 0);
//   for (int i = 0; i < 8; i++) {
//     gpio_put(TDI_PIN, (data >> i) & 1); // Send the data bit
//     gpio_put(TCK_PIN, 1);
//     tdo_data |= (gpio_get(TDO_PIN) << i); // Read the TDO bit
//     gpio_put(TCK_PIN, 0);
//   }
//   gpio_put(TMS_PIN, 1); // Exit the data register
//   gpio_put(TCK_PIN, 1);
//   gpio_put(TCK_PIN, 0);
//   return tdo_data;
// }

// int main(void) {
//   jtag_init();
//   uint8_t tdo_data;
//   while(1){
//   tdo_data = jtag_shift_dr(0x09);
// //   sleep_ ms(1);
//   }
//   return 0;
// }

#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"

// JTAG pins
#define TDI 16
#define TDO 17
#define TCK 18
#define TMS 19
#define DR_SCAN 1
#define IR_SCAN 0
enum JTAG_TAP_STATE {
    TEST_LOGIC_RESET,
    RUN_TEST_IDLE,
    SELECT_DR_SCAN,
    CAPTURE_DR,
    SHIFT_DR,
    EXIT1_DR,
    PAUSE_DR,
    EXIT2_DR,
    UPDATE_DR,
    SELECT_IR_SCAN,
    CAPTURE_IR,
    SHIFT_IR,
    EXIT1_IR,
    PAUSE_IR,
    EXIT2_IR,
    UPDATE_IR
};

// void jtag_tap_state_transition(enum JTAG_TAP_STATE state) {
//     switch (state) {
//         case TEST_LOGIC_RESET:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             // Set TMS low and TCK low
//             gpio_put(TMS,0);
//             gpio_put(TCK,0);
//             break;
//         case RUN_TEST_IDLE:
//             // Set TMS low and TCK high
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             gpio_put(TCK,0);
//             break;
//         case SELECT_DR_SCAN:
//             // Set TMS low and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             gpio_put(TCK,0);
//             break;
//         case CAPTURE_DR:
//             // Set TMS high and TCK high
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             gpio_put(TCK,0);
//             break;
//         case SHIFT_DR:
//             // Set TMS high and TCK low
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             gpio_put(TCK,0);
//             break;
//         case EXIT1_DR:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             gpio_put(TCK,0);
//             break;
//         case PAUSE_DR:
//             // Set TMS low and TCK high
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             break;
//         case EXIT2_DR:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             break;
//         case UPDATE_DR:
//             // Set TMS low and TCK high
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             break;
//         case SELECT_IR_SCAN:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             break;
//         case CAPTURE_IR:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             break;
//         case SHIFT_IR:
//             // Set TMS high and TCK low
//             gpio_put(TMS,1);
//             gpio_put(TCK,0);
//             // Shift in instruction bits
//             // (shift in code here)
//             break;
//         case EXIT1_IR:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             break;
//         case PAUSE_IR:
//             // Set TMS low and TCK high
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             break;
//         case EXIT2_IR:
//             // Set TMS high and TCK high
//             gpio_put(TMS,1);
//             gpio_put(TCK,1);
//             break;
//         case UPDATE_IR:
//             // Set TMS low and TCK high
//             gpio_put(TMS,0);
//             gpio_put(TCK,1);
//             break;
//     }
// }

void jtag_state_initialization(int state_register){
    if(state_register == DR_SCAN){
            //run test idle
            gpio_put(TMS,0);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            //select dr scan
            gpio_put(TMS,1);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            //capture dr
            gpio_put(TMS,0);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            //shift dr
            gpio_put(TMS,0);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
    }
    else if(state_register == IR_SCAN){
            //run test idle
            gpio_put(TMS,0);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            //select ir scan
            gpio_put(TMS,1);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            gpio_put(TMS,1);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            //capture ir
            gpio_put(TMS,0);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
            //shift ir
            gpio_put(TMS,0);
            gpio_put(TCK,1);
            gpio_put(TCK,0);
    }
}

void jtag_state_deinit(int state_register){
    if(state_register == DR_SCAN){
        // exit1 dr
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        //pause dr
        gpio_put(TMS,0);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        //exit2 dr
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        // update dr 1
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        //run test idle
        gpio_put(TMS,0);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
    }
    else if(state_register == IR_SCAN){
        // exit1 ir
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        //pause ir
        gpio_put(TMS,0);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        //exit2 ir
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        // update ir 1
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
        //run test idle
        gpio_put(TMS,0);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
    }
}
void jtag_tap_reset() {
    // Set TMS high for 5 clock cycles
    for (int i = 0; i < 5; i++) {
        gpio_put(TMS,1);
        gpio_put(TCK,1);
        gpio_put(TCK,0);
    }
}

void jtag_tap_state_transition(int state) {
    // Shift state value into TMS and clock it in
    for (int i = 0; i < 4; i++) {
        if (state & (1 << i)) {
            gpio_put(TMS,1);
        } else {
            gpio_put(TMS,0);
        }
        gpio_put(TCK,1);
        gpio_put(TCK,0);
    }
}

void jtag_tap_write_ir(int instruction, int length) {
    // Go to Shift-IR state
    jtag_tap_state_transition(SELECT_IR_SCAN);
    jtag_tap_state_transition(CAPTURE_IR);
    jtag_tap_state_transition(SHIFT_IR);

    // Shift instruction into TDI and read TDO
    for (int i = 0; i < length; i++) {
        if (instruction & (1 << i)) {
            gpio_put(TDI,1);
        } else {
            gpio_put(TDI,0);
        }
        gpio_put(TCK,1);
        gpio_put(TCK,0);
    }

    // Exit Shift-IR state
    jtag_tap_state_transition(EXIT1_IR);
    jtag_tap_state_transition(PAUSE_IR);
    jtag_tap_state_transition(EXIT2_IR);
    jtag_tap_state_transition(UPDATE_IR);
}

void jtag_tap_write_dr(int data, int length) {
    // Go to Shift-DR state
    // jtag_tap_state_transition(SELECT_DR_SCAN);
    // jtag_tap_state_transition(CAPTURE_DR);
    // jtag_tap_state_transition(SHIFT_DR);
    jtag_state_initialization(DR_SCAN);
    // Shift data into TDI and read TDO
    for (int i = 0; i < length; i++) {
        if (data & (1 << i)) {
            gpio_put(TDI,1);
        } else {
            gpio_put(TDI,0);
        }
        gpio_put(TCK,1);
        gpio_put(TCK,0);
    }

    // Exit Shift-DR state
    jtag_state_deinit(DR_SCAN);
    // jtag_tap_state_transition(EXIT1_DR);
    // jtag_tap_state_transition(PAUSE_DR);
    // jtag_tap_state_transition(EXIT2_DR);
    // jtag_tap_state_transition(UPDATE_DR);
}


void jtag_tap_read_ir(int *instruction, int length) {
    // Go to Shift-IR state
    jtag_tap_state_transition(SELECT_IR_SCAN);
    jtag_tap_state_transition(CAPTURE_IR);
    jtag_tap_state_transition(SHIFT_IR);

    // Shift instruction from TDO and write it to instruction variable
    int data = 0;
    for (int i = 0; i < length; i++) {
        gpio_put(TCK,1);
        if (gpio_get(TDO)) {
            data |= (1 << i);
        }
        gpio_put(TCK,0);
    }
    *instruction = data;

    // Exit Shift-IR state
    jtag_tap_state_transition(EXIT1_IR);
    jtag_tap_state_transition(PAUSE_IR);
    jtag_tap_state_transition(EXIT2_IR);
    jtag_tap_state_transition(UPDATE_IR);
}


void jtag_tap_read_dr(int *data, int length) {
    // Go to Shift-DR state
    jtag_tap_state_transition(SELECT_DR_SCAN);
    jtag_tap_state_transition(CAPTURE_DR);
    jtag_tap_state_transition(SHIFT_DR);

    // Shift data from TDO and write it to data variable
    int read_data = 0;
    for (int i = 0; i < length; i++) {
        gpio_put(TCK,1);
        if (gpio_get(TDO)) {
            read_data |= (1 << i);
        }
        gpio_put(TCK,0);
    }
    *data = read_data;

    // Exit Shift-DR state
    jtag_tap_state_transition(EXIT1_DR);
    jtag_tap_state_transition(PAUSE_DR);
    jtag_tap_state_transition(EXIT2_DR);
    jtag_tap_state_transition(UPDATE_DR);
}
void jtag_tap_close() {
    // Go to Test-Logic-Reset state
    jtag_tap_state_transition(TEST_LOGIC_RESET);

    // Deinitialize gpio
    gpio_deinit(TDI);
    gpio_deinit(TMS);
    gpio_deinit(TCK);
    gpio_deinit(TDO);
}
int main() {
    // Initialize gpio
    gpio_init(TDI);
    gpio_init(TMS);
    gpio_init(TCK);
    gpio_init(TDO);

    // Configure JTAG pins as output
    gpio_set_dir(TDI, 1);
    gpio_set_dir(TMS, 1);
    gpio_set_dir(TCK, 1);
    gpio_set_dir(TDO, 0);

    // Reset JTAG TAP interface
    jtag_tap_reset();

    // Example of writing instruction to JTAG instruction register
    int instruction = 0xDEADBEEF;
    int instruction_length = 32;
    //while(1){
    // jtag_tap_write_ir(instruction, instruction_length);

    // Example of reading data from JTAG data register
    int data;
    int data_length = 32;
    jtag_tap_write_dr(instruction, instruction_length);
    //}
    // Close JTAG TAP interface
    jtag_tap_close();

    return 0;
} 