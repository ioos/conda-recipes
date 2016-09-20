#!/bin/bash

# Set in `conda_forge_build_setup` to `-j2 ${MAKEFLAGS}` and that breaks the build here :-(
export MAKEFLAGS=""

if [ ! -f configure ];
then
   autoreconf -i --force
fi

./configure --prefix=${PREFIX}

make
make check
make install
