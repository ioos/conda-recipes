:: Ensure our geos will be used.
set GEOS_DIR=%LIBRARY_PREFIX%
rmdir %SRC_DIR%/geos-3.3.3 /s /q

"%PYTHON%" setup.py install
if errorlevel 1 exit 1
