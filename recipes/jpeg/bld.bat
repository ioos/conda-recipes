:: Configure step.
copy jconfig.vc jconfig.h
if errorlevel 1 exit 1

:: Build step.
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release .
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

:: Install step.
nmake install
if errorlevel 1 exit 1
