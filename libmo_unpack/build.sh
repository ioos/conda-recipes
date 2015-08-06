#!/bin/bash
mkdir m4
autoreconf --install

CFLAGS="-O3 -mfpmath=sse -msse"

if [[ $(uname) == Darwin ]]
then
    CFLAGS="$CFLAGS -D_DARWIN_SOURCE"
fi
./configure --prefix=$PREFIX CFLAGS="$CFLAGS"
make
make install
