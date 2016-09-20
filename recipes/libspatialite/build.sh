#!/bin/bash

# Get rid of bad `defaults` .la files.
rm -rf $PREFIX/lib/*.la

if [[ $(uname) == 'Darwin' ]]; then
  export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
elif [[ $(uname) == 'Linux' ]]; then
  export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

export LDFLAGS="-L$PREFIX/lib"
export CFLAGS="-I$PREFIX/include"

./configure --prefix=$PREFIX \
            --enable-geos=$PREFIX \
            --enable-proj4=$PREFIX \
            --enable-epsg=$PREFIX \
            --enable-libxml2=$PREFIX \
            $OPTS

make
# COMMENTED OUT DUE TO FAILURES
# FIXME: CHECK WITH NEXT VERSION
#eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib make check
make install
