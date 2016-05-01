#!/bin/bash

$PYTHON waf configure --python_env --prefix=$PREFIX && \
$PYTHON waf build && \
$PYTHON waf install
