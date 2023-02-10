# add_executable(pio_jtag)

# pico_generate_pio_header(pio_jtag ${CMAKE_CURRENT_LIST_DIR}/jtag.pio)

# target_sources(pio_jtag PRIVATE jtag.c)

# target_link_libraries(pio_jtag PRIVATE pico_stdlib hardware_pio)
# pico_add_extra_outputs(pio_jtag)

# # add url via pico_set_program_url
# example_auto_set_url(pio_jtag)

# # generate .hex file and .pio.h file for the RP2040 datasheet (to make sure
# # the datasheet always shows the output of the latest pioasm version)
# add_custom_target(pio_jtag_datasheet DEPENDS
# 		${CMAKE_CURRENT_LIST_DIR}/generated/jtag.hex
# 		${CMAKE_CURRENT_LIST_DIR}/generated/jtag.pio.h
# 		${CMAKE_CURRENT_LIST_DIR}/generated/jtag.pio.h
# 		)
# add_custom_command(OUTPUT ${CMAKE_CURRENT_LIST_DIR}/generated/jtag.hex
#         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/jtag.pio
#         COMMAND Pioasm -o hex ${CMAKE_CURRENT_LIST_DIR}/jtag.pio ${CMAKE_CURRENT_LIST_DIR}/generated/jtag.hex
#         )
# add_custom_command(OUTPUT ${CMAKE_CURRENT_LIST_DIR}/generated/jtag.pio.h
#         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/jtag.pio
#         COMMAND Pioasm ${CMAKE_CURRENT_LIST_DIR}/jtag.pio ${CMAKE_CURRENT_LIST_DIR}/generated/jtag.pio.h
#         )
# add_custom_command(OUTPUT ${CMAKE_CURRENT_LIST_DIR}/generated/jtag_wrap.pio.h
#         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/jtag_wrap.pio
#         COMMAND Pioasm ${CMAKE_CURRENT_LIST_DIR}/jtag_wrap.pio ${CMAKE_CURRENT_LIST_DIR}/generated/jtag_wrap.pio.h
#         )
# add_dependencies(pio_jtag pio_jtag_datasheet)

add_executable(pio_jtagN)

pico_generate_pio_header(pio_jtagN ${CMAKE_CURRENT_LIST_DIR}/jtagN.pio)

target_sources(pio_jtagN PRIVATE jtag.c)

target_link_libraries(pio_jtagN PRIVATE pico_stdlib hardware_pio)
pico_add_extra_outputs(pio_jtagN)

# add url via pico_set_program_url
example_auto_set_url(pio_jtagN)