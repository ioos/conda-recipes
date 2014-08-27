#!/bin/bash

conda config --set binstar_upload yes

DIR=iris

if [ ! -d "$DIR" ]; then
#   git clone https://github.com/SciTools/iris.git
  git clone https://github.com/rhattersley/iris.git --branch lazy-dtype --single-branch iris
fi

pushd $DIR
  current=$(git pull); echo "$current"
  iris_ver=$(grep "\s*version=" setup.py | cut -d "'" -f 2)
  hash=$(git rev-parse --short $(git rev-parse --abbrev-ref HEAD))
  iris_ver=${iris_ver/-/_}
  VERSION=${iris_ver}_${hash}
popd

echo $VERSION

BUILDDIR=.

sed -e "s/\${VERSION}/$VERSION/" meta_template.yaml > $BUILDDIR/meta.yaml

conda build $BUILDDIR
