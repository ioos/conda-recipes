#!/bin/bash

# Get rid of bad `defaults` .la files.
rm -rf $PREFIX/lib/*.la

./configure --prefix=$PREFIX \
            --with-libxml-prefix=$PREFIX

make
make check
make install
