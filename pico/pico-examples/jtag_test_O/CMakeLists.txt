add_executable(pio_jtagO)

pico_generate_pio_header(pio_jtagO ${CMAKE_CURRENT_LIST_DIR}/jtagO.pio)

target_sources(pio_jtagO PRIVATE jtag.c)

target_link_libraries(pio_jtagO PRIVATE pico_stdlib hardware_pio)
pico_add_extra_outputs(pio_jtagO)

# add url via pico_set_program_url
example_auto_set_url(pio_jtagO)