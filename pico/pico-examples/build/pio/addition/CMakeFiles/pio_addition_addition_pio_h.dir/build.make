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
CMAKE_SOURCE_DIR = /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build

# Utility rule file for pio_addition_addition_pio_h.

# Include any custom commands dependencies for this target.
include pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/compiler_depend.make

# Include the progress variables for this target.
include pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/progress.make

pio/addition/CMakeFiles/pio_addition_addition_pio_h: pio/addition/addition.pio.h

pio/addition/addition.pio.h: /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/addition/addition.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating addition.pio.h"
	cd /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/addition && ../../pioasm/pioasm -o c-sdk /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/addition/addition.pio /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/addition/addition.pio.h

pio_addition_addition_pio_h: pio/addition/CMakeFiles/pio_addition_addition_pio_h
pio_addition_addition_pio_h: pio/addition/addition.pio.h
pio_addition_addition_pio_h: pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/build.make
.PHONY : pio_addition_addition_pio_h

# Rule to build all files generated by this target.
pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/build: pio_addition_addition_pio_h
.PHONY : pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/build

pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/clean:
	cd /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/addition && $(CMAKE_COMMAND) -P CMakeFiles/pio_addition_addition_pio_h.dir/cmake_clean.cmake
.PHONY : pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/clean

pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/depend:
	cd /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/pio/addition /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/addition /home/ubuntu/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pio/addition/CMakeFiles/pio_addition_addition_pio_h.dir/depend

