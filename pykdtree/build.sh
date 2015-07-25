#!/bin/bash

if [[ $(uname) == Darwin ]]; then
    USE_OMP=0  # Damn clang!
else
    USE_OMP=1
fi

export USE_OMP

$PYTHON setup.py install install --single-version-externally-managed --record record.txt
