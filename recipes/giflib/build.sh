#!/bin/bash

if [[ $(uname) == 'Darwin' ]]; then
  export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
elif [[ $(uname) == 'Linux' ]]; then
  export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi


./configure --prefix=${PREFIX}

make

if [[ $(uname) == 'Linux' ]]; then
eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib make check
fi

make install
