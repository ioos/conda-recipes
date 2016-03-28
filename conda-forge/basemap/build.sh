#!/bin/bash

# Ensure our geos will be used.
rm -rf $SRC_DIR\geos-3.3.3
export GEOS_DIR=$PREFIX

$PYTHON setup.py install
