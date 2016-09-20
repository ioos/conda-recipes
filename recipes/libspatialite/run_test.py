import os
import sys
import ctypes
import platform

if sys.platform == 'win32':
    libfreexl = ctypes.CDLL('spatialite.dll')
elif sys.platform == 'darwin':
    # LD_LIBRARY_PATH not set on OSX or Linux
    path = os.path.expandvars('$PREFIX/lib/libspatialite.dylib')
    libfreexl = ctypes.CDLL(path)
else:
    path = os.path.expandvars('$PREFIX/lib/libspatialite.so')
    libfreexl = ctypes.CDLL(path)
