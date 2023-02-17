# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build

# Utility rule file for pio_squarewave_datasheet.

# Include the progress variables for this target.
include pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/progress.make

pio/squarewave/CMakeFiles/pio_squarewave_datasheet: ../pio/squarewave/generated/squarewave.hex
pio/squarewave/CMakeFiles/pio_squarewave_datasheet: ../pio/squarewave/generated/squarewave.pio.h
pio/squarewave/CMakeFiles/pio_squarewave_datasheet: ../pio/squarewave/generated/squarewave_wrap.pio.h


../pio/squarewave/generated/squarewave.hex: ../pio/squarewave/squarewave.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../../pio/squarewave/generated/squarewave.hex"
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/squarewave && ../../pioasm/pioasm -o hex /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave/squarewave.pio /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave/generated/squarewave.hex

../pio/squarewave/generated/squarewave.pio.h: ../pio/squarewave/squarewave.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ../../../pio/squarewave/generated/squarewave.pio.h"
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/squarewave && ../../pioasm/pioasm /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave/squarewave.pio /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave/generated/squarewave.pio.h

../pio/squarewave/generated/squarewave_wrap.pio.h: ../pio/squarewave/squarewave_wrap.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating ../../../pio/squarewave/generated/squarewave_wrap.pio.h"
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/squarewave && ../../pioasm/pioasm /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave/squarewave_wrap.pio /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave/generated/squarewave_wrap.pio.h

pio_squarewave_datasheet: pio/squarewave/CMakeFiles/pio_squarewave_datasheet
pio_squarewave_datasheet: ../pio/squarewave/generated/squarewave.hex
pio_squarewave_datasheet: ../pio/squarewave/generated/squarewave.pio.h
pio_squarewave_datasheet: ../pio/squarewave/generated/squarewave_wrap.pio.h
pio_squarewave_datasheet: pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/build.make

.PHONY : pio_squarewave_datasheet

# Rule to build all files generated by this target.
pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/build: pio_squarewave_datasheet

.PHONY : pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/build

pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/clean:
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/squarewave && $(CMAKE_COMMAND) -P CMakeFiles/pio_squarewave_datasheet.dir/cmake_clean.cmake
.PHONY : pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/clean

pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/depend:
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/squarewave /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/squarewave /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pio/squarewave/CMakeFiles/pio_squarewave_datasheet.dir/depend

