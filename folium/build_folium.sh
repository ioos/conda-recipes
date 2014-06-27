#!/bin/bash

conda config --set binstar_upload yes

DIR=folium

if [ ! -d "$DIR" ]; then
  git clone https://github.com/wrobstory/folium.git
fi

pushd $DIR
  current=$(git pull); echo "$current"
  setup_ver=$(grep "\s*version=" setup.py | cut -d "'" -f 2)
  hash=$(git rev-parse --short $(git rev-parse --abbrev-ref HEAD))
  setup_ver=${setup_ver/-/_}
  VERSION=${setup_ver}_${hash}
popd

echo $VERSION

BUILDDIR=np18py27

sed -e "s/\${VERSION}/$VERSION/" meta.yaml > $BUILDDIR/meta.yaml

conda build $BUILDDIR
