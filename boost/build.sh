#!/bin/bash

cd ./tools/build

./bootstrap.sh

./b2 install --prefix=$PREFIX
