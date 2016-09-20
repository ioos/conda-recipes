set SITECFG=cf_units/etc/site.cfg
echo [System] > %SITECFG%
echo udunits2_path = %SCRIPTS%\udunits2.dll >> %SITECFG%
echo udunits2_xml_path = %LIBRARY_PREFIX%\share\udunits\udunits2.xml >> %SITECFG%

"%PYTHON%" setup.py install --single-version-externally-managed  --record record.txt
if errorlevel 1 exit 1
