cmake_minimum_required(VERSION 3.16)
project(wesl_hello VERSION 0.1) #versioning a good idea?


set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

add_executable(wesl_hello src/main.c)


if(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
    message(STATUS "Building for ARM")
    target_compile_definitions(wesl_hello PRIVATE TARGET_ARM=1)
else()
    message(STATUS "Building for x86")
    target_compile_definitions(wesl_hello PRIVATE TARGET_X86=1)
endif()