#!/bin/bash

conda config --set binstar_upload yes

for PY in 27 33 34
do
    export CONDA_PY=$PY
    conda build .
done
