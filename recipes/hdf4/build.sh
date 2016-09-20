#!/bin/bash

OPTS="--with-jpeg"

if [[ $(uname) == Darwin ]]; then
  export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
  OPTS=""
fi



export CXXFLAGS="${CFLAGS}"
export LDFLAGS="-L${PREFIX}/lib ${LDFLAGS}"
export CFLAGS="${CFLAGS} -pipe -O2 -fPIC -I${PREFIX}/include"

chmod +x configure

# The --enable-silent-rules is needed because Travis CI dies on the long output from this build.
./configure --prefix=${PREFIX}\
            --enable-linux-lfs \
            --enable-silent-rules \
            --enable-shared \
            --with-ssl \
            --with-zlib \
            --disable-netcdf \
            --disable-fortran \
            $OPTS

make
make check
make install

# Avoid clashing names with netcdf.
mv ${PREFIX}/bin/ncdump ${PREFIX}/bin/h4_ncdump
mv ${PREFIX}/bin/ncgen ${PREFIX}/bin/h4_ncgen

# People usually Google these.
rm -rf ${PREFIX}/examples
