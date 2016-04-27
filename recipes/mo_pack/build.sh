#!/bin/bash

${PYTHON} -sE setup.py build_ext --inplace "-I${PREFIX}/include" "-L${PREFIX}/lib" "-R${PREFIX}/lib" install --single-version-externally-managed --record record.txt

