# Install script for directory: /home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/i2c

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/bmp280_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/bus_scan/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/lcd_1602_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/lis3dh_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/mcp9808_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/mma8451_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/mpl3115a2_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/mpu6050_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/oled_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/pa1010d_i2c/cmake_install.cmake")
  include("/home/cyclone/Desktop/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/i2c/pcf8523_i2c/cmake_install.cmake")

endif()

