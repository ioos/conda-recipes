#!/bin/bash
#cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .
#./autogen.sh 
./configure --prefix=$PREFIX
make
make install
