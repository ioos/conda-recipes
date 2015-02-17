#!/bin/bash

if [[ $(uname) != Darwin ]]
then
    export LDFLAGS=-L$LD_RUN_PATH
    export CFLAGS="-I$PREFIX/include"
fi
sh configure --prefix=$PREFIX --enable-shared --disable-debug --disable-dependency-tracking

make
make install
