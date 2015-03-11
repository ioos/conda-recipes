#!/bin/bash


# Problems with cartopy if the -64 flag is not defined. See https://taskman.eionet.europa.eu/issues/14817.
CFLAGS="-m64" CPPFLAGS="-m64" CXXFLAGS="-m64" LDFLAGS="-m64" FFLAGS="-m64" ./configure --prefix=$PREFIX --without-jni
make
make install
