# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build

# Utility rule file for pio_quadrature_encoder_quadrature_encoder_pio_h.

# Include any custom commands dependencies for this target.
include pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/compiler_depend.make

# Include the progress variables for this target.
include pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/progress.make

pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h: pio/quadrature_encoder/quadrature_encoder.pio.h

pio/quadrature_encoder/quadrature_encoder.pio.h: /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/pio/quadrature_encoder/quadrature_encoder.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating quadrature_encoder.pio.h"
	cd /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/pio/quadrature_encoder && ../../pioasm/pioasm -o c-sdk /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/pio/quadrature_encoder/quadrature_encoder.pio /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/pio/quadrature_encoder/quadrature_encoder.pio.h

pio_quadrature_encoder_quadrature_encoder_pio_h: pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h
pio_quadrature_encoder_quadrature_encoder_pio_h: pio/quadrature_encoder/quadrature_encoder.pio.h
pio_quadrature_encoder_quadrature_encoder_pio_h: pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/build.make
.PHONY : pio_quadrature_encoder_quadrature_encoder_pio_h

# Rule to build all files generated by this target.
pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/build: pio_quadrature_encoder_quadrature_encoder_pio_h
.PHONY : pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/build

pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/clean:
	cd /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/pio/quadrature_encoder && $(CMAKE_COMMAND) -P CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/cmake_clean.cmake
.PHONY : pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/clean

pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/depend:
	cd /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/pio/quadrature_encoder /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/pio/quadrature_encoder /home/ubuntu/RPI_JTAG/dirtyJTAG/pico/pico-examples/build/pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pio/quadrature_encoder/CMakeFiles/pio_quadrature_encoder_quadrature_encoder_pio_h.dir/depend

