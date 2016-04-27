:: Needed so we can find stdint.h from msinttypes.
set LIB=%LIBRARY_LIB%;%LIB%
set LIBPATH=%LIBRARY_LIB%;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_BUILD_TYPE=Release ^
      .
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

mkdir %SCRIPTS%
move %LIBRARY_BIN%\xmlwf.exe %SCRIPTS%\xmlwf.exe || exit 1
move %LIBRARY_BIN%\expat.dll %SCRIPTS%\expat.dll || exit 1
