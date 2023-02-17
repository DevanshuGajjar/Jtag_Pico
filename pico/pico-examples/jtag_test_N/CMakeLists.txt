if (TARGET tinyusb_device)
    add_executable(pio_jtag 
    jtag.c
    pio_jtag.c
    cmd.c
    )

    pico_generate_pio_header(pio_jtag ${CMAKE_CURRENT_LIST_DIR}/jtag.pio)

    target_link_libraries(pio_jtag PRIVATE pico_stdlib hardware_pio hardware_dma pico_multicore)
    
    
    pico_enable_stdio_usb(pio_jtag 1)
    pico_enable_stdio_uart(pio_jtag 0)
    
    pico_add_extra_outputs(pio_jtag)

    # create map/bin/hex/uf2 file etc.
    pico_add_extra_outputs(pio_jtag)
    # add url via pico_set_program_url
    example_auto_set_url(pio_jtag)

elseif(PICO_ON_DEVICE)
    message(WARNING "not building hello_usb because TinyUSB submodule is not initialized in the SDK")
endif()
