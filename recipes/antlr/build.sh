#!/bin/bash

./configure --prefix=$PREFIX \
            --enable-cxx \
            --enable-python \
            --enable-csharp \
            --disable-java \

make
make install
