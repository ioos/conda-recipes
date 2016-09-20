#!/bin/bash

autoreconf

./configure --prefix=$PREFIX

make
# FIXME: Without bison 3 tests will fail.
# But conda-build-all does not allow for circular dependencies.
# make check
make install
