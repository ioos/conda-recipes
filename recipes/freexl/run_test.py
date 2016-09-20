# Load libfreexl using ctypes.

import os
import sys
import ctypes

if sys.platform == 'win32':
    libfreexl = ctypes.CDLL('freexl.dll')
elif sys.platform == 'darwin':
    # LD_LIBRARY_PATH not set on OSX or Linux.
    path = os.path.expandvars('$PREFIX/lib/libfreexl.dylib')
    libfreexl = ctypes.CDLL(path)
else:
    path = os.path.expandvars('$PREFIX/lib/libfreexl.so')
    libfreexl = ctypes.CDLL(path)
