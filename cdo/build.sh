#!/bin/bash

./configure --prefix=$PREFIX \
            --disable-debug \
            --disable-dependency-tracking \
            --with-jasper=$PREFIX \
            --with-grib_api=$PREFIX \
            --with-hdf5=$PREFIX \
            --with-netcdf=$PREFIX \
            --with-proj=$PREFIX

make
make install
