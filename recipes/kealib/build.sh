#!/bin/bash

if [ $(uname) == Darwin ]; then
    export CC=clang
    export CXX=clang++
    export MACOSX_DEPLOYMENT_TARGET="10.9"
    export CXXFLAGS="-stdlib=libc++ $CXXFLAGS"
    export CXXFLAGS="$CXXFLAGS -stdlib=libc++"
fi


cd trunk
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D CMAKE_SKIP_RPATH=ON \
-D HDF5_INCLUDE_DIR=$PREFIX/include \
-D HDF5_LIB_PATH=$PREFIX/lib \
.

make
make install
