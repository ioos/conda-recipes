#!/bin/bash

if [[ $(uname) == 'Darwin' ]]; then
  export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
elif [[ $(uname) == 'Linux' ]]; then
  export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

export HAVE_ANTLR=yes
export HAVE_NETCDF4_H=yes
export NETCDF_ROOT=$PREFIX

if [[ $(uname) == Darwin ]]; then
  export LDFLAGS="-headerpad_max_install_names"
  ARGS="--disable-regex --disable-shared --disable-doc"
else
  ARGS="--disable-dependency-tracking"
fi

./configure --prefix=$PREFIX $ARGS


make
eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib make check
make install
