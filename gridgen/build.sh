#!/bin/bash

./configure --prefix=$PREFIX
make
make lib
make shlib
make install
