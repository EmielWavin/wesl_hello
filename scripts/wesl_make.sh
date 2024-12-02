#!/bin/bash

echo "Building X86 Application" 
mkdir ../build
cd ../build
mkdir linux
cd linux
cmake ../..
make
./wesl_hello
cd ..

echo "Building ARM Application"
echo "TODO: Set Source!"
mkdir arm
echo $(pwd)
cd arm
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../toolchain.cmake
make
