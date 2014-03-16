#!/bin/bash

./configure --prefix=$PREFIX --without-jni
make
make install
