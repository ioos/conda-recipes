#!/bin/bash

if [ $(uname) == Darwin ]; then
    SONAME="dylib"
else
    SONAME="so"
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D TIFF_LIBRARY=$PREFIX/lib/libtiff.${SONAME} \
      -D TIFF_INCLUDE_DIR=$PREFIX/include \
      -D PNG_LIBRARY_RELEASE=$PREFIX/lib/libpng.${SONAME} \
      -D PNG_PNG_INCLUDE_DIR=$PREFIX/include \
      -D ZLIB_LIBRARY=$PREFIX/lib/libz.${SONAME} \
      -D ZLIB_INCLUDE_DIR=$PREFIX/include \
      .

make
make tests
make install
make clean
