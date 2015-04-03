#!/bin/bash

UNAME=$(uname -s)
if [ ${UNAME} = 'Darwin' ]; then
    export CFLAGS="-mmacosx-version-min=`xcrun --sdk macosx --show-sdk-version`"
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS="$CFLAGS"
fi

$PYTHON setup.py install --single-version-externally-managed  --record record.txt
