#!/bin/bash

./configure --prefix=$PREFIX --without-jni

make

if [[ $(uname) == Linux ]]; then
    make check
fi

make install
