#!/bin/bash

#$PYTHON setup.py build_ext  --swig-opts=['-I"${PREFIX}"/include']
export C_INCLUDE_PATH=$PREFIX/include
export LD_LIBRARY_PATH=$PREFIX/lib
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
