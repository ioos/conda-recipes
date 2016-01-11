#!/bin/bash

conda clean --yes --source-cache

$PYTHON runsetup.py
