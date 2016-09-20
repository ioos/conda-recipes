#!/bin/bash

CFLAGS="-fPIC" ./configure --shared --prefix=$PREFIX

make
make check
make install

# Copy license file to the source directory so conda-build can find it.
cp $RECIPE_DIR/license.txt $SRC_DIR/license.txt
