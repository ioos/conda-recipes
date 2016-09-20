#!/bin/bash

if [[ $(uname) == Darwin ]]; then
    export CC=clang
    export CXX=clang++
    export MACOSX_VERSION_MIN="10.9"
    export MACOSX_DEPLOYMENT_TARGET="${MACOSX_VERSION_MIN}"
    export CMAKE_OSX_DEPLOYMENT_TARGET="${MACOSX_VERSION_MIN}"
    export CFLAGS="${CFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -stdlib=libc++"
    export LDFLAGS="${LDFLAGS} -headerpad_max_install_names"
    export LDFLAGS="${LDFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export LDFLAGS="${LDFLAGS} -lc++"
    export LINKFLAGS="${LDFLAGS}"
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
    export CXX="${CXX} -stdlib=libc++"
elif [[ $(uname) == Linux ]]; then
  export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

# Pass explicit paths to the prefix for each dependency.
./configure --prefix="${PREFIX}" \
            --with-zlib-include-dir="${PREFIX}/include" \
            --with-zlib-lib-dir="${PREFIX}/lib" \
            --with-jpeg-include-dir="${PREFIX}/include" \
            --with-jpeg-lib-dir="${PREFIX}/lib"

make
eval ${LIBRARY_SEARCH_VAR}=$PREFIX/lib make check
make install
