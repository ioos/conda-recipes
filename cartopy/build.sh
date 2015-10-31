#!/bin/bash

rm -rf lib/cartopy/tests/mpl/baseline_images

${PYTHON} -sE setup.py install --single-version-externally-managed --record record.txt
