#!/bin/bash

./autogen.sh

./configure --prefix=$PREFIX \
            --with-zlib=$PREFIX \
            --without-python
#             --with-lzma=$PREFIX \

make
make check
make install
