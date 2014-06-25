#!/bin/bash
cd ./tools/build/v2
./bootstrap.sh
./b2 install --prefix=$PREFIX
