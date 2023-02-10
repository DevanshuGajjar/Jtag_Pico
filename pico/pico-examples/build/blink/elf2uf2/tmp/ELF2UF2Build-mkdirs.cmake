# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-sdk/tools/elf2uf2"
  "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/elf2uf2"
  "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2"
  "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2/tmp"
  "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2/src/ELF2UF2Build-stamp"
  "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2/src"
  "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2/src/ELF2UF2Build-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2/src/ELF2UF2Build-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/blink/elf2uf2/src/ELF2UF2Build-stamp${cfgdir}") # cfgdir has leading slash
endif()
