#!/bin/bash

if [[ $(uname) == Darwin ]]
then
    EXT=dylib
else
    EXT=so
fi
