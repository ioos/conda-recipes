#!/bin/bash

export DATADIR="$PREFIX/share/basemap"

mkdir -p $DATADIR

cp $SRC_DIR/lib/mpl_toolkits/basemap/data/*_i.dat $DATADIR
cp $SRC_DIR/lib/mpl_toolkits/basemap/data/*_h.dat $DATADIR
cp $SRC_DIR/lib/mpl_toolkits/basemap/data/*_f.dat $DATADIR
cp $SRC_DIR/lib/mpl_toolkits/basemap/data/UScounties.* $DATADIR
