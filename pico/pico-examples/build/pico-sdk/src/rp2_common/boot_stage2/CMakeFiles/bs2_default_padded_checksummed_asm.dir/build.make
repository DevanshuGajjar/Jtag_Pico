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

# Utility rule file for bs2_default_padded_checksummed_asm.

# Include the progress variables for this target.
include pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/progress.make

pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm: pico-sdk/src/rp2_common/boot_stage2/bs2_default_padded_checksummed.S


pico-sdk/src/rp2_common/boot_stage2/bs2_default_padded_checksummed.S: pico-sdk/src/rp2_common/boot_stage2/bs2_default.bin
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating bs2_default_padded_checksummed.S"
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2 && /usr/bin/python3.8 /home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/boot_stage2/pad_checksum -s 0xffffffff /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2/bs2_default.bin /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2/bs2_default_padded_checksummed.S

pico-sdk/src/rp2_common/boot_stage2/bs2_default.bin: pico-sdk/src/rp2_common/boot_stage2/bs2_default.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating bs2_default.bin"
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2 && /usr/bin/arm-none-eabi-objcopy -Obinary /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2/bs2_default.elf /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2/bs2_default.bin

bs2_default_padded_checksummed_asm: pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm
bs2_default_padded_checksummed_asm: pico-sdk/src/rp2_common/boot_stage2/bs2_default_padded_checksummed.S
bs2_default_padded_checksummed_asm: pico-sdk/src/rp2_common/boot_stage2/bs2_default.bin
bs2_default_padded_checksummed_asm: pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/build.make

.PHONY : bs2_default_padded_checksummed_asm

# Rule to build all files generated by this target.
pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/build: bs2_default_padded_checksummed_asm

.PHONY : pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/build

pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/clean:
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2 && $(CMAKE_COMMAND) -P CMakeFiles/bs2_default_padded_checksummed_asm.dir/cmake_clean.cmake
.PHONY : pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/clean

pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/depend:
	cd /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples /home/cyclone/Desktop/pico/pico-sdk/src/rp2_common/boot_stage2 /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2 /home/cyclone/rpi_pico_jtag/Jtag_Repo/Jtag_Pico/pico/pico-examples/build/pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pico-sdk/src/rp2_common/boot_stage2/CMakeFiles/bs2_default_padded_checksummed_asm.dir/depend

