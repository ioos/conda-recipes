#!/bin/bash

# CDAT-lite v5.2 finds the HDF5 library by checking for the static version,
# so we pretend it exists.
touch $PREFIX/lib/libhdf5.a

# cdat_lite-5.2-1.tar.gz ships with broken symlinks which get in the way
# of setup.py getting started, so we remove them.
rm lib/MV2.py
rm lib/cdat_info.py

export NETCDF_HOME=$PREFIX
export HDF5_HOME=$PREFIX
$PYTHON setup.py install --prefix=$PREFIX

# Tidy up the fake static library.
rm $PREFIX/lib/libhdf5.a
