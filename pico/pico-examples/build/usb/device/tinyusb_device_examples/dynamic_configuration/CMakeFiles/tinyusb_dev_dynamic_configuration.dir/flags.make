# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile ASM with /usr/bin/arm-none-eabi-gcc
# compile C with /usr/bin/arm-none-eabi-gcc
# compile CXX with /usr/bin/arm-none-eabi-g++
ASM_FLAGS = -mcpu=cortex-m0plus -mthumb -O3 -DNDEBUG   -Wall -Wno-format -Wno-unused-function -Wno-maybe-uninitialized -Wextra -Werror -Wfatal-errors -Wdouble-promotion -Wfloat-equal -Wshadow -Wwrite-strings -Wsign-compare -Wmissing-format-attribute -Wunreachable-code -Wcast-align -Wcast-qual -Wnull-dereference -Wuninitialized -Wunused -Wredundant-decls -Wcast-function-type -Wstrict-overflow -Wno-strict-aliasing -ffunction-sections -fdata-sections

ASM_DEFINES = -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DLIB_PICO_BIT_OPS=1 -DLIB_PICO_BIT_OPS_PICO=1 -DLIB_PICO_BOOTSEL_VIA_DOUBLE_RESET=1 -DLIB_PICO_DIVIDER=1 -DLIB_PICO_DIVIDER_HARDWARE=1 -DLIB_PICO_DOUBLE=1 -DLIB_PICO_DOUBLE_PICO=1 -DLIB_PICO_FIX_RP2040_USB_DEVICE_ENUMERATION=1 -DLIB_PICO_FLOAT=1 -DLIB_PICO_FLOAT_PICO=1 -DLIB_PICO_INT64_OPS=1 -DLIB_PICO_INT64_OPS_PICO=1 -DLIB_PICO_MALLOC=1 -DLIB_PICO_MEM_OPS=1 -DLIB_PICO_MEM_OPS_PICO=1 -DLIB_PICO_PLATFORM=1 -DLIB_PICO_PRINTF=1 -DLIB_PICO_PRINTF_PICO=1 -DLIB_PICO_RUNTIME=1 -DLIB_PICO_STANDARD_LINK=1 -DLIB_PICO_STDIO=1 -DLIB_PICO_STDIO_UART=1 -DLIB_PICO_STDLIB=1 -DLIB_PICO_SYNC=1 -DLIB_PICO_SYNC_CRITICAL_SECTION=1 -DLIB_PICO_SYNC_MUTEX=1 -DLIB_PICO_SYNC_SEM=1 -DLIB_PICO_TIME=1 -DLIB_PICO_UTIL=1 -DLIB_TINYUSB_BOARD=1 -DLIB_TINYUSB_DEVICE=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Release\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_RP2040_USB_DEVICE_ENUMERATION_FIX=1 -DPICO_RP2040_USB_DEVICE_UFRAME_FIX=1 -DPICO_TARGET_NAME=\"tinyusb_dev_dynamic_configuration\" -DPICO_USE_BLOCKED_RAM=0

ASM_INCLUDES = -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/examples/device/dynamic_configuration/src -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_stdlib/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_gpio/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_base/include -I/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/generated/pico_base -I/home/cyclone/Desktop/pico/pico-sdk/src/boards/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_platform/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2040/hardware_regs/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_base/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2040/hardware_structs/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_claim/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_sync/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_irq/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_sync/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_time/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_timer/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_util/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_uart/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_resets/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_clocks/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_pll/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_vreg/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_watchdog/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_xosc/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_divider/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_runtime/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_printf/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_bit_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_divider/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_double/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_float/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_malloc/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_bootrom/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_binary_info/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_stdio/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_stdio_uart/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_int64_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_mem_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/boot_stage2/include -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/common -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/hw -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include 

C_FLAGS = -mcpu=cortex-m0plus -mthumb -O3 -DNDEBUG   -Wall -Wno-format -Wno-unused-function -Wno-maybe-uninitialized -Wextra -Werror -Wfatal-errors -Wdouble-promotion -Wfloat-equal -Wshadow -Wwrite-strings -Wsign-compare -Wmissing-format-attribute -Wunreachable-code -Wcast-align -Wcast-qual -Wnull-dereference -Wuninitialized -Wunused -Wredundant-decls -Wcast-function-type -Wstrict-overflow -Wno-strict-aliasing -ffunction-sections -fdata-sections -std=gnu11

C_DEFINES = -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DLIB_PICO_BIT_OPS=1 -DLIB_PICO_BIT_OPS_PICO=1 -DLIB_PICO_BOOTSEL_VIA_DOUBLE_RESET=1 -DLIB_PICO_DIVIDER=1 -DLIB_PICO_DIVIDER_HARDWARE=1 -DLIB_PICO_DOUBLE=1 -DLIB_PICO_DOUBLE_PICO=1 -DLIB_PICO_FIX_RP2040_USB_DEVICE_ENUMERATION=1 -DLIB_PICO_FLOAT=1 -DLIB_PICO_FLOAT_PICO=1 -DLIB_PICO_INT64_OPS=1 -DLIB_PICO_INT64_OPS_PICO=1 -DLIB_PICO_MALLOC=1 -DLIB_PICO_MEM_OPS=1 -DLIB_PICO_MEM_OPS_PICO=1 -DLIB_PICO_PLATFORM=1 -DLIB_PICO_PRINTF=1 -DLIB_PICO_PRINTF_PICO=1 -DLIB_PICO_RUNTIME=1 -DLIB_PICO_STANDARD_LINK=1 -DLIB_PICO_STDIO=1 -DLIB_PICO_STDIO_UART=1 -DLIB_PICO_STDLIB=1 -DLIB_PICO_SYNC=1 -DLIB_PICO_SYNC_CRITICAL_SECTION=1 -DLIB_PICO_SYNC_MUTEX=1 -DLIB_PICO_SYNC_SEM=1 -DLIB_PICO_TIME=1 -DLIB_PICO_UTIL=1 -DLIB_TINYUSB_BOARD=1 -DLIB_TINYUSB_DEVICE=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Release\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_RP2040_USB_DEVICE_ENUMERATION_FIX=1 -DPICO_RP2040_USB_DEVICE_UFRAME_FIX=1 -DPICO_TARGET_NAME=\"tinyusb_dev_dynamic_configuration\" -DPICO_USE_BLOCKED_RAM=0

C_INCLUDES = -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/examples/device/dynamic_configuration/src -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_stdlib/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_gpio/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_base/include -I/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/generated/pico_base -I/home/cyclone/Desktop/pico/pico-sdk/src/boards/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_platform/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2040/hardware_regs/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_base/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2040/hardware_structs/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_claim/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_sync/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_irq/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_sync/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_time/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_timer/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_util/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_uart/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_resets/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_clocks/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_pll/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_vreg/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_watchdog/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_xosc/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_divider/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_runtime/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_printf/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_bit_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_divider/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_double/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_float/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_malloc/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_bootrom/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_binary_info/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_stdio/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_stdio_uart/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_int64_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_mem_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/boot_stage2/include -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/common -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/hw -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include 

CXX_FLAGS = -mcpu=cortex-m0plus -mthumb -O3 -DNDEBUG   -Wall -Wno-format -Wno-unused-function -Wno-maybe-uninitialized -Wextra -Werror -Wfatal-errors -Wdouble-promotion -Wfloat-equal -Wshadow -Wwrite-strings -Wsign-compare -Wmissing-format-attribute -Wunreachable-code -Wcast-align -Wcast-qual -Wnull-dereference -Wuninitialized -Wunused -Wredundant-decls -Wcast-function-type -Wstrict-overflow -Wno-strict-aliasing -ffunction-sections -fdata-sections -fno-exceptions -fno-unwind-tables -fno-rtti -fno-use-cxa-atexit -std=gnu++17

CXX_DEFINES = -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DLIB_PICO_BIT_OPS=1 -DLIB_PICO_BIT_OPS_PICO=1 -DLIB_PICO_BOOTSEL_VIA_DOUBLE_RESET=1 -DLIB_PICO_DIVIDER=1 -DLIB_PICO_DIVIDER_HARDWARE=1 -DLIB_PICO_DOUBLE=1 -DLIB_PICO_DOUBLE_PICO=1 -DLIB_PICO_FIX_RP2040_USB_DEVICE_ENUMERATION=1 -DLIB_PICO_FLOAT=1 -DLIB_PICO_FLOAT_PICO=1 -DLIB_PICO_INT64_OPS=1 -DLIB_PICO_INT64_OPS_PICO=1 -DLIB_PICO_MALLOC=1 -DLIB_PICO_MEM_OPS=1 -DLIB_PICO_MEM_OPS_PICO=1 -DLIB_PICO_PLATFORM=1 -DLIB_PICO_PRINTF=1 -DLIB_PICO_PRINTF_PICO=1 -DLIB_PICO_RUNTIME=1 -DLIB_PICO_STANDARD_LINK=1 -DLIB_PICO_STDIO=1 -DLIB_PICO_STDIO_UART=1 -DLIB_PICO_STDLIB=1 -DLIB_PICO_SYNC=1 -DLIB_PICO_SYNC_CRITICAL_SECTION=1 -DLIB_PICO_SYNC_MUTEX=1 -DLIB_PICO_SYNC_SEM=1 -DLIB_PICO_TIME=1 -DLIB_PICO_UTIL=1 -DLIB_TINYUSB_BOARD=1 -DLIB_TINYUSB_DEVICE=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Release\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_RP2040_USB_DEVICE_ENUMERATION_FIX=1 -DPICO_RP2040_USB_DEVICE_UFRAME_FIX=1 -DPICO_TARGET_NAME=\"tinyusb_dev_dynamic_configuration\" -DPICO_USE_BLOCKED_RAM=0

CXX_INCLUDES = -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/examples/device/dynamic_configuration/src -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_stdlib/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_gpio/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_base/include -I/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/generated/pico_base -I/home/cyclone/Desktop/pico/pico-sdk/src/boards/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_platform/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2040/hardware_regs/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_base/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2040/hardware_structs/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_claim/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_sync/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_irq/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_sync/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_time/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_timer/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_util/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_uart/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_resets/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_clocks/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_pll/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_vreg/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_watchdog/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_xosc/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/hardware_divider/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_runtime/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_printf/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_bit_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_divider/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_double/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_float/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_malloc/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_bootrom/include -I/home/cyclone/Desktop/pico/pico-sdk/src/common/pico_binary_info/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_stdio/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_stdio_uart/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_int64_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_mem_ops/include -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/boot_stage2/include -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/common -I/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/hw -I/home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include 

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/portable/raspberrypi/rp2040/rp2040_usb.c.obj_FLAGS = -Wno-stringop-overflow -Wno-array-bounds

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/device/usbd.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/device/usbd_control.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/audio/audio_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/cdc/cdc_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/dfu/dfu_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/dfu/dfu_rt_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/hid/hid_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/midi/midi_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/class/usbtmc/usbtmc_device.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/tusb.c.obj_FLAGS = -Wno-conversion

# Custom flags: usb/device/tinyusb_device_examples/dynamic_configuration/CMakeFiles/tinyusb_dev_dynamic_configuration.dir/home/cyclone/Desktop/pico/pico-sdk/lib/tinyusb/src/common/tusb_fifo.c.obj_FLAGS = -Wno-conversion

