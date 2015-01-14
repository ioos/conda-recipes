#!/bin/bash

cd libmo_unpack

if [[ $(uname) == Darwin ]]
then
   # Just build for this version for now.
   unset MACOSX_DEPLOYMENT_TARGET
   gcc -c -fPIC -O3 -mfpmath=sse -msse -I include -D_LARGEFILE_SOURCE -D_DARWIN_SOURCE *.c

   ld -dylib -undefined dynamic_lookup -arch x86_64 -o lib/libmo_unpack.dylib *.o
else
   gcc -c -fPIC -O4 -mfpmath=sse -msse -I include -D_LARGEFILE_SOURCE *.c

   gcc -shared -Wl,-soname,libmo_unpack.so -o lib/libmo_unpack.so *.o
fi

# Actually install the built product.
mkdir $PREFIX/lib $PREFIX/include
cp lib/* $PREFIX/lib
cp include/* $PREFIX/include
