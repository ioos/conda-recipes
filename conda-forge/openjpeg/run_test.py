#!/usr/bin/env python

"""
Test script for openjpeg.

Currently main purpose is to check that the openjpeg library
if linked dynamically to libpng, libtiff and libz as in 
the latest build recipe.
"""

import os
import sys
import subprocess

# this next bit is very platform dependent since the tool to 
# use and the name of the exe changes

# Note: libopenpj2 lib does not actually link to libtiff etc
# but executeables do so just check opj_dump for now
if sys.platform.startswith('linux'):
    exe = os.path.expandvars('$PREFIX/bin/opj_dump')
    if not os.path.exists(exe):
        raise IOError('Cannot find %s' % exe)

    libs = []
    data = subprocess.check_output(['ldd', exe])
    for line in data.split(b'\n'):
        parts = line.split(b' ')
        if len(parts) == 4 and parts[2] != b'':
            libs.append(parts[2])

    req_libs = [b'libtiff.so', b'libpng16.so', b'libz.so']
    libs_found = {}
    for lib in req_libs:
        libs_found[lib] = False

    prefix = os.getenv('PREFIX')
    if sys.version_info[0] >= 3:
        prefix = bytes(prefix, 'utf-8')
    for lib in libs:
        for req in req_libs:
            if req in lib and lib.startswith(prefix):
                libs_found[req] = True

    for req in req_libs:
        if not libs_found[req]:
            raise SystemExit('%s not linked against %s' % (exe, req))

else:
    print('%s not yet supported' % sys.platform)
