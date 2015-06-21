#!/bin/bash

export HAVE_NETCDF4_H=yes
export NETCDF_ROOT=$PREFIX

if [[ $(uname) == Darwin ]]; then
    ./configure \
        HAVE_ANTLR=yes \
        --prefix=$PREFIX \
        --disable-regex \
        --disable-shared
else
    ./configure \
        HAVE_ANTLR=yes \
        --prefix=$PREFIX \
        --with-zlib=$PREFIX \
        --disable-dependency-tracking \
        --enable-netcdf4 \
        --disable-static \
        --disable-udunits \
        --enable-udunits2 \
        --disable-dap-opendap \
        --enable-dap-netcdf
fi

make
make install
