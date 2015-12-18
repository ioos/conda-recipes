#!/bin/bash

./configure --enable-java \
            --enable-cxx \
            --enable-python \
            --enable-csharp \
            --prefix=$PREFIX

make
make install
