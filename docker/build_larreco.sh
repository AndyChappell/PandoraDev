#!/bin/bash
set -e # script must exit if an error occurs

# Set compiler flags
if [ "$COMPILER " = "g++ " ]
then
    export CXX="g++"
    export CC="gcc"
elif [ "$COMPILER " = "clang " ]
then
    export CXX="clang++"
    export CC="clang"
fi

# Build project
mkdir build
cd build
cmake -DCMAKE_MODULE_PATH=/pandora/PandoraPFA/cmakemodules -DPANDORA_MONITORING=ON -DPandoraSDK_DIR=/pandora/PandoraSDK -DPandoraMonitoring_DIR=/pandora/PandoraMonitoring -DLArContent_DIR=/pandora/LArContent ..
make -j2 install
cd /pandora