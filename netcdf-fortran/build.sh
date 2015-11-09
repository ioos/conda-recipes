#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    export DYLD_LIBRARY_PATH=${PREFIX}/lib:${PREFIX}/lib64
else
    export LD_LIBRARY_PATH=${PREFIX}/lib:${PREFIX}/lib64
fi

CPPFLAGS=-I$PREFIX/include LDFLAGS=-L$PREFIX/lib ./configure --prefix=$PREFIX

make
make check
make install
