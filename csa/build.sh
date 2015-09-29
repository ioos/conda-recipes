#!/bin/bash

cd csa

./configure --prefix=$PREFIX
make
make tests
make install
