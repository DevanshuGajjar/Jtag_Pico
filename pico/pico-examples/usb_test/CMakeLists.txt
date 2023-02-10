if (TARGET tinyusb_device)
    add_executable(usb_t1
            usb_t1.c
            )

    # pull in common dependencies
    target_link_libraries(usb_t1 pico_stdlib)

    # enable usb output, disable uart output
    pico_enable_stdio_usb(usb_t1 1)
    pico_enable_stdio_uart(usb_t1 0)

    # create map/bin/hex/uf2 file etc.
    pico_add_extra_outputs(usb_t1)

    # add url via pico_set_program_url
    example_auto_set_url(usb_t1)
elseif(PICO_ON_DEVICE)
    message(WARNING "not building usb_t1 because TinyUSB submodule is not initialized in the SDK")
endif()
