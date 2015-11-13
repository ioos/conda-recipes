#!/usr/bin/env bash

$PYTHON setup.py install --record record.txt
$PYTHON test/run_tests.py