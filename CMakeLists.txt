cmake_minimum_required(VERSION 3.13)

project(packetspammer)

# Enable c99 standard
set(CMAKE_C_STANDARD 99)

# Add main.cpp file of project root directory as source file
set(SOURCE_FILES packetspammer.c)

add_library(radiotap SHARED IMPORTED)
set_target_properties(radiotap PROPERTIES
        SUFFIX .dylib
        IMPORTED_LOCATION               "$ENV{HOME}/.local/lib/libradiotap.dylib"
        INTERFACE_INCLUDE_DIRECTORIES   "$ENV{HOME}/.local/include"
        )

find_library(PCap libpcap)

# Add executable target with source files listed in SOURCE_FILES variable
add_executable(packetspammer ${SOURCE_FILES})
target_link_libraries(packetspammer radiotap PCap)