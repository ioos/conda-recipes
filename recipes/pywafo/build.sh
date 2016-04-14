#!/bin/bash

# for f in `find . | grep build_all.py`; do
#   directory=`dirname $f`
#   pushd $directory
#     python build_all.py
#   popd
# done

# for so in rind2007/rindmod.so mvnprd/mvnprdmod.so c_codes/c_library.so mvn/mvn.so; do
#     cp src/wafo/source/$so wafo
# done

$PYTHON setup.py install --single-version-externally-managed --record record.txt
