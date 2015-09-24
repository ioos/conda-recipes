#!/bin/bash

cd nn

./configure --prefix=$PREFIX
make
make tests
make install
