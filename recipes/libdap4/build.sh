#!/bin/bash

# Get rid of bad `defaults` .la files.
rm -rf $PREFIX/lib/*.la

if [ $(uname) == Darwin ]; then
    export CC=clang
    export CXX=clang++
    export MACOSX_DEPLOYMENT_TARGET="10.9"
    export CXXFLAGS="-stdlib=libc++ $CXXFLAGS"
    export CXXFLAGS="$CXXFLAGS -stdlib=libc++"
fi


export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
export CPPFLAGS="-I$PREFIX/include $CPPFLAGS"

autoreconf --force --install

bash configure --prefix=$PREFIX \
               --with-xml2=$PREFIX \
               --with-curl=$PREFIX \
               --enable-threads=pth

make
# Check fails on OS X for some reason.
# if [ $(uname) == Linux ]; then
#   make check
# fi
make install
