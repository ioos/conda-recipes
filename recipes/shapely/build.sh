#!/bin/bash

export GEOS_DIR=$PREFIX

$PYTHON setup.py install --single-version-externally-managed --record record.txt
