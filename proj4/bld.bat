nmake -f makefile.vc INSTDIR=%PREFIX%
if errorlevel 1 exit 1

nmake -f makefile.vc INSTDIR=%PREFIX% install-all
if errorlevel 1 exit 1

move %PREFIX%\bin\*.* %PREFIX%
if errorlevel 1 exit 1
