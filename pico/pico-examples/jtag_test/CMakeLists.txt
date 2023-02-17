set(PICO_SDK_PATH $ENV{PICO_SDK_PATH})

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(pio_jtag C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()


add_executable(pio_jtag
    jtag.c
    pio_jtag.c
    get_serial.c
    usb_descriptors.c
    cmd.c
)

target_include_directories(pio_jtag PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

pico_generate_pio_header(pio_jtag ${CMAKE_CURRENT_LIST_DIR}/jtag.pio)

pico_set_program_name(pio_jtag "pio_jtag")
pico_set_program_version(pio_jtag "0.1")

target_sources(pio_jtag PRIVATE jtag.c pio_jtag.c get_serial.c usb_descriptors.c cmd.c)

target_link_libraries(pio_jtag PRIVATE pico_stdlib)

target_link_libraries(pio_jtag PRIVATE pico_stdlib 
    hardware_pio 
    hardware_dma 
    pico_multicore 
    pico_unique_id 
    tinyusb_device 
    tinyusb_board
)

pico_add_extra_outputs(pio_jtag)

# add url via pico_set_program_url
example_auto_set_url(pio_jtag)