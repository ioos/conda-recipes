set SITECFG=lib/iris/etc/site.cfg
echo [System] > %SITECFG%
echo udunits2_path = %SCRIPTS%\udunits2.dll >> %SITECFG%

rmdir lib\iris\tests\results /s /q
rmdir lib\iris\tests\*.npz /s /q

%PYTHON% -sE setup.py install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1
