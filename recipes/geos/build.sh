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
    export CXX="${CXX} -stdlib=libc++"
fi

./configure --prefix=$PREFIX

make

# Failing on OS X: https://travis-ci.org/conda-forge/geos-feedstock/builds/119038524
if [[ $(uname) == Linux ]]; then
    make check
fi

make install
