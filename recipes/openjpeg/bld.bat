
cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D TIFF_LIBRARY=%LIBRARY_LIB%\libtiff.lib ^
      -D TIFF_INCLUDE_DIR=%LIBRARY_INC% ^
      -D PNG_LIBRARY_RELEASE=%LIBRARY_LIB%\libpng.lib ^
      -D PNG_PNG_INCLUDE_DIR=%LIBRARY_INC% ^
      -D ZLIB_LIBRARY=%LIBRARY_LIB%\zlib.lib ^
      -D ZLIB_INCLUDE_DIR=%LIBRARY_INC% ^
      -D CMAKE_BUILD_TYPE=Release ^
      .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
