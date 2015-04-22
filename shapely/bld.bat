set LIB=%LIBRARY_LIB%;%LIB%
set LIBPATH=%LIBRARY_LIB%;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%

%PYTHON% setup.py build_ext -I %LIBRARY_INC% -L %LIBRARY_LIB% -l geos_c
%PYTHON% setup.py install
