add_executable(pio_jtag)

pico_generate_pio_header(pio_jtag ${CMAKE_CURRENT_LIST_DIR}/jtag.pio)

target_sources(pio_jtag PRIVATE jtag.c)

target_link_libraries(pio_jtag PRIVATE pico_stdlib hardware_pio hardware_dma)
pico_add_extra_outputs(pio_jtag)

# add url via pico_set_program_url
example_auto_set_url(pio_jtag)