# Install script for directory: /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/adc

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/arm-none-eabi-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/adc/adc_console/cmake_install.cmake")
  include("/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/adc/dma_capture/cmake_install.cmake")
  include("/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/adc/hello_adc/cmake_install.cmake")
  include("/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/adc/joystick_display/cmake_install.cmake")
  include("/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/adc/onboard_temperature/cmake_install.cmake")
  include("/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/adc/microphone_adc/cmake_install.cmake")

endif()
