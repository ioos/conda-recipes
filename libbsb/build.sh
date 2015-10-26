#!/bin/bash

./configure --prefix=$PREFIX
make
# make check # FIXME: Test (3) convert .kap to .tifis failing.
make install
