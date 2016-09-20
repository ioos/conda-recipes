set LIB=%LIB%;%LIBRARY_LIB%
set INCLUDE=%INCLUDE%;%LIBRARY_INC%
set LIBPATH=%LIBPATH%;%LIBRARY_LIB%

:: Tell the build where to find zlib and jpeg
set BLD_OPTS=JPEG_SUPPORT=1 ^
    JPEGDIR=%LIBRARY_PREFIX% ^
    JPEG_INCLUDE=%LIBRARY_INC% ^
    JPEG_LIB=%LIBRARY_LIB%\libjpeg.lib ^
    ZIP_SUPPORT=1 ^
    ZLIBDIR=%LIBRARY_PREFIX% ^
    ZLIB_INCLUDE=%LIBRARY_INC% ^
    ZLIB_LIB=%LIBRARY_LIB%\zlib.lib

:: Build.
nmake /f Makefile.vc %BLD_OPTS%
if errorlevel 1 exit 1

:: Install.
copy libtiff\libtiff.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1

copy libtiff\libtiff.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1

copy libtiff\libtiff.lib %LIBRARY_LIB%\tiff.lib
if errorlevel 1 exit 1

copy libtiff\libtiff_i.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1

xcopy libtiff\*.h %LIBRARY_INC%\
if errorlevel 1 exit 1
