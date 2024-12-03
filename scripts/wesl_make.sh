#!/bin/bash

#First clear all build files????

#Build steps for X86 Linux Application
echo "Building X86 Application" 
mkdir ../build
cd ../build
mkdir linux
cd linux
cmake ../..
make
./wesl_hello
cd ..

(
    #Build steps for X-build ARM application
    echo "Building ARM Application"
    source /opt/wavin/0.0.1/environment-setup-cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi
    mkdir arm
    cd arm
    echo $(pwd)
    cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../toolchain.cmake
    make
)
