#!/bin/bash

pushd oil_library
$PYTHON setup.py install  --single-version-externally-managed --record record.txt
popd

# FIXME: Do we need a post-link.sh with:
# pushd $RECIPE_DIR
# $PYTHON setup.py remake_oil_db
# popd
