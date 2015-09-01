#!/bin/bash

$SYS_PYTHON -c "import conda_build; print(conda_build.__file__);"

mkdir -p $PREFIX/bin
cp $SYS_PYTHON-config $PREFIX/bin/

LDFLAGS="-L$PREFIX/lib -Wl,-rpath,$PREFIX/lib" PYTHON="$PYTHON" PYTHON_LDFLAGS="$PREFIX/lib" CFLAGS="-fPIC -I$PREFIX/include" ./configure --with-jasper=$PREFIX/lib --disable-fortran --prefix=$PREFIX --enable-python

make
make install


# For some reason the installer places the Python files in a sub-directory
# of site-packages called "grib_api". (NB. The sub-directory is not a package.)
# The install instructions in python/README include the suggestion:
#   Add this folder to your PYTHONPATH and you are ready to go.
# Instead of that, we just rename the directory and make it a package.
mv $SP_DIR/grib_api $SP_DIR/gribapi
mv $SP_DIR/gribapi/gribapi.py $SP_DIR/gribapi/__init__.py

# Delete useless files
find $PREFIX/lib -name '*.a' -delete
find $PREFIX/lib -name '*.la' -delete
