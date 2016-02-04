#!/bin/bash

conda clean --yes --source-cache

$PYTHON waf configure --python_env --prefix=$PREFIX && \
$PYTHON waf build && \
$PYTHON waf install
