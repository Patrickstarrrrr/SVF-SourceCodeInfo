# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.26.4/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.26.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jiayi/SVF-SourceCodeInfo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jiayi/SVF-SourceCodeInfo

# Include any dependencies generated for this target.
include svf-llvm/tools/MTA/CMakeFiles/mta.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include svf-llvm/tools/MTA/CMakeFiles/mta.dir/compiler_depend.make

# Include the progress variables for this target.
include svf-llvm/tools/MTA/CMakeFiles/mta.dir/progress.make

# Include the compile flags for this target's objects.
include svf-llvm/tools/MTA/CMakeFiles/mta.dir/flags.make

svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.o: svf-llvm/tools/MTA/CMakeFiles/mta.dir/flags.make
svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.o: svf-llvm/tools/MTA/mta.cpp
svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.o: svf-llvm/tools/MTA/CMakeFiles/mta.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jiayi/SVF-SourceCodeInfo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.o"
	cd /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.o -MF CMakeFiles/mta.dir/mta.cpp.o.d -o CMakeFiles/mta.dir/mta.cpp.o -c /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA/mta.cpp

svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mta.dir/mta.cpp.i"
	cd /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA/mta.cpp > CMakeFiles/mta.dir/mta.cpp.i

svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mta.dir/mta.cpp.s"
	cd /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA/mta.cpp -o CMakeFiles/mta.dir/mta.cpp.s

# Object files for target mta
mta_OBJECTS = \
"CMakeFiles/mta.dir/mta.cpp.o"

# External object files for target mta
mta_EXTERNAL_OBJECTS =

bin/mta: svf-llvm/tools/MTA/CMakeFiles/mta.dir/mta.cpp.o
bin/mta: svf-llvm/tools/MTA/CMakeFiles/mta.dir/build.make
bin/mta: z3.obj/lib/libz3.dylib
bin/mta: lib/libSvfLLVM.a
bin/mta: /opt/homebrew/opt/llvm@16/lib/libLLVM.dylib
bin/mta: lib/libSvfCore.a
bin/mta: z3.obj/lib/libz3.dylib
bin/mta: svf-llvm/tools/MTA/CMakeFiles/mta.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jiayi/SVF-SourceCodeInfo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/mta"
	cd /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mta.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
svf-llvm/tools/MTA/CMakeFiles/mta.dir/build: bin/mta
.PHONY : svf-llvm/tools/MTA/CMakeFiles/mta.dir/build

svf-llvm/tools/MTA/CMakeFiles/mta.dir/clean:
	cd /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA && $(CMAKE_COMMAND) -P CMakeFiles/mta.dir/cmake_clean.cmake
.PHONY : svf-llvm/tools/MTA/CMakeFiles/mta.dir/clean

svf-llvm/tools/MTA/CMakeFiles/mta.dir/depend:
	cd /Users/jiayi/SVF-SourceCodeInfo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jiayi/SVF-SourceCodeInfo /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA /Users/jiayi/SVF-SourceCodeInfo /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA /Users/jiayi/SVF-SourceCodeInfo/svf-llvm/tools/MTA/CMakeFiles/mta.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : svf-llvm/tools/MTA/CMakeFiles/mta.dir/depend

