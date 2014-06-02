#!/bin/bash

if [[ $(uname) == Darwin ]]
then
    EXT=dylib
else
    EXT=so
fi

echo ""
echo "Must set environmental variable:"
echo "export UDUNITS2_XML_PATH=$PREFIX/share/udunits/udunits2.xml"
