#!/bin/bash

if [[ $(uname) == Darwin ]]
then
    EXT=dylib
else
    EXT=so
fi


SITECFG=$SP_DIR/iris/etc/site.cfg
echo "[System]" > $SITECFG
echo "udunits2_path = $PREFIX/lib/libudunits2.${EXT}" >> $SITECFG

echo ""
echo ""
echo "Must set environmental variable:"
echo "export UDUNITS2_XML_PATH=<PREFIX>/share/udunits/udunits2.xml"
