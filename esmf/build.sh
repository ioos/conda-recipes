#!/bin/bash


export ESMF_DIR=`pwd`
export ESMF_INSTALL_PREFIX=${PREFIX}
export ESMF_NETCDF="split"
export ESMF_NETCDF_INCLUDE=${PREFIX}/include
export ESMF_NETCDF_LIBPATH=${PREFIX}/lib
export ESMF_COMM=mpich2

make  -j ${CPU_COUNT}
# TODO (bekozi): Enable all ESMF tests.
#make all_tests | tee ~/esmf_all_tests.out
make install
