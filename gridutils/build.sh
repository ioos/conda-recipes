#!/bin/bash

#cd external/gridutils
./configure --prefix=$PREFIX
#sed -i 's/CFLAGS = -g -O2 -Wall -pedantic/CFLAGS = -g -O2 -Wall -pedantic -fPIC/g' makefile
make
make lib
make shlib
make install
