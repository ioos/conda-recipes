cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_BUILD_TYPE=Release ^
      .
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

copy lib\*.exp %LIBRARY_LIB%\ || exit 1
copy lib\*.lib %LIBRARY_LIB%\ || exit 1
copy include\geos.h %LIBRARY_INC%\geos.h || exit 1
