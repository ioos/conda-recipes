#!/bin/bash

UNAME=$(uname -s)
if [ ${UNAME} = 'Darwin' ]; then
    export CFLAGS="-mmacosx-version-min=`xcrun --sdk macosx --show-sdk-version`"
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS="$CFLAGS"
fi

$PYTHON setup.py install

# Add more build steps here, if they are necessary.

# copy rasterio scripts to the conda bin directory

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
