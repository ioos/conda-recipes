#!/bin/bash

pushd py_gnome
$PYTHON setup.py install  --single-version-externally-managed --record record.txt
popd
