cmake_minimum_required(VERSION 3.16)
project(wesl_hello VERSION 0.01) #versioning a good idea?


set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)



add_executable(wesl_hello src/main.c)