"%PYTHON%" waf --check-c-compiler=gcc configure build --prefix="%PREFIX%"
if errorlevel 1 exit 1

"%PYTHON%" waf build
if errorlevel 1 exit 1

"%PYTHON%" waf install
if errorlevel 1 exit 1

:: Move binaries to conda paths.
move %PREFIX%\bin\* %SCRIPTS%\ || exit 1
