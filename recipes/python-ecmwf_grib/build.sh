#!/bin/bash

export PYTHON="$PYTHON"
export PYTHON_LDFLAGS="$PREFIX/lib"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
export CFLAGS="$CFLAGS -fPIC -I$PREFIX/include"
if [[ $(uname) == Darwin ]]; then
  export LDFLAGS="-undefined dynamic_lookup -bundle $LDFLAGS"
fi

mkdir build_ecmwf && cd build_ecmwf
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D ENABLE_JPG=1 \
      -D ENABLE_NETCDF=1 \
      -D ENABLE_PNG=1 \
      -D ENABLE_FORTRAN=0 \
      -D ENABLE_PYTHON=1 \
      $SRC_DIR

make
make install

if [[ $(uname) == Darwin ]]; then
  ln -s $SP_DIR/gribapi/_gribapi_swig.dylib $SP_DIR/gribapi/_gribapi_swig.so
fi
