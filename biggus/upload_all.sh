#!/bin/bash

conda config --set binstar_upload yes

for PY in 27 33 34
do
    for NPY in 17 18
    do
        export CONDA_PY=$PY
        export CONDA_NPY=$NPY
        conda build .
    done
done
