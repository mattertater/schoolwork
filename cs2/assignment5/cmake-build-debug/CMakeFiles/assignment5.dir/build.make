# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.6

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files (x86)\JetBrains\CLion 2016.3.3\bin\cmake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files (x86)\JetBrains\CLion 2016.3.3\bin\cmake\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/assignment5.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/assignment5.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/assignment5.dir/flags.make

CMakeFiles/assignment5.dir/main.cpp.obj: CMakeFiles/assignment5.dir/flags.make
CMakeFiles/assignment5.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/assignment5.dir/main.cpp.obj"
	C:\MinGW\bin\g++.exe   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\assignment5.dir\main.cpp.obj -c C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\main.cpp

CMakeFiles/assignment5.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/assignment5.dir/main.cpp.i"
	C:\MinGW\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\main.cpp > CMakeFiles\assignment5.dir\main.cpp.i

CMakeFiles/assignment5.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/assignment5.dir/main.cpp.s"
	C:\MinGW\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\main.cpp -o CMakeFiles\assignment5.dir\main.cpp.s

CMakeFiles/assignment5.dir/main.cpp.obj.requires:

.PHONY : CMakeFiles/assignment5.dir/main.cpp.obj.requires

CMakeFiles/assignment5.dir/main.cpp.obj.provides: CMakeFiles/assignment5.dir/main.cpp.obj.requires
	$(MAKE) -f CMakeFiles\assignment5.dir\build.make CMakeFiles/assignment5.dir/main.cpp.obj.provides.build
.PHONY : CMakeFiles/assignment5.dir/main.cpp.obj.provides

CMakeFiles/assignment5.dir/main.cpp.obj.provides.build: CMakeFiles/assignment5.dir/main.cpp.obj


# Object files for target assignment5
assignment5_OBJECTS = \
"CMakeFiles/assignment5.dir/main.cpp.obj"

# External object files for target assignment5
assignment5_EXTERNAL_OBJECTS =

assignment5.exe: CMakeFiles/assignment5.dir/main.cpp.obj
assignment5.exe: CMakeFiles/assignment5.dir/build.make
assignment5.exe: CMakeFiles/assignment5.dir/linklibs.rsp
assignment5.exe: CMakeFiles/assignment5.dir/objects1.rsp
assignment5.exe: CMakeFiles/assignment5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable assignment5.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\assignment5.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/assignment5.dir/build: assignment5.exe

.PHONY : CMakeFiles/assignment5.dir/build

CMakeFiles/assignment5.dir/requires: CMakeFiles/assignment5.dir/main.cpp.obj.requires

.PHONY : CMakeFiles/assignment5.dir/requires

CMakeFiles/assignment5.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\assignment5.dir\cmake_clean.cmake
.PHONY : CMakeFiles/assignment5.dir/clean

CMakeFiles/assignment5.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5 C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5 C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\cmake-build-debug C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\cmake-build-debug C:\Users\Matt\Desktop\ayy\Programming\cs2\assignment5\cmake-build-debug\CMakeFiles\assignment5.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/assignment5.dir/depend

