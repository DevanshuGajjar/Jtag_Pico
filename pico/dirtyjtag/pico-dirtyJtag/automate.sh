#!/bin/bash



echo "removing build"
echo ".........."
rm -rf build
echo "creating build"
echo ".........."
mkdir build
echo "going inside the build"
echo ".........."
cd "build" 
echo "running cmake .."
echo ".........."
cmake ..
echo "running make"
echo "........."
make -j4
cd "build"
