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
CMAKE_SOURCE_DIR = /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build

# Utility rule file for dirtyJtag_jtag_pio_h.

# Include the progress variables for this target.
include CMakeFiles/dirtyJtag_jtag_pio_h.dir/progress.make

CMakeFiles/dirtyJtag_jtag_pio_h: jtag.pio.h


jtag.pio.h: ../jtag.pio
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating jtag.pio.h"
	pioasm/pioasm -o c-sdk /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/jtag.pio /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build/jtag.pio.h

dirtyJtag_jtag_pio_h: CMakeFiles/dirtyJtag_jtag_pio_h
dirtyJtag_jtag_pio_h: jtag.pio.h
dirtyJtag_jtag_pio_h: CMakeFiles/dirtyJtag_jtag_pio_h.dir/build.make

.PHONY : dirtyJtag_jtag_pio_h

# Rule to build all files generated by this target.
CMakeFiles/dirtyJtag_jtag_pio_h.dir/build: dirtyJtag_jtag_pio_h

.PHONY : CMakeFiles/dirtyJtag_jtag_pio_h.dir/build

CMakeFiles/dirtyJtag_jtag_pio_h.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dirtyJtag_jtag_pio_h.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dirtyJtag_jtag_pio_h.dir/clean

CMakeFiles/dirtyJtag_jtag_pio_h.dir/depend:
	cd /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build /home/om/Desktop/task_rpi_pico/dirtyjtag/pico-dirtyJtag/build/CMakeFiles/dirtyJtag_jtag_pio_h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dirtyJtag_jtag_pio_h.dir/depend

