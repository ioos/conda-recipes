#!/bin/bash

if [ `uname` == Darwin ]; then
    echo "No soup for you!"
fi

if [ `uname` == Linux ]; then
    $PYTHON setup.py install
fi
