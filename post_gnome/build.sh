#!/bin/bash

pushd post_gnome
$PYTHON setup.py install  --single-version-externally-managed --record record.txt
popd
