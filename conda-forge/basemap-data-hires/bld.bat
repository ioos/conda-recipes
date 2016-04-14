set DATADIR="%LIBRARY_PREFIX%\share\basemap"

if not exist %DATADIR% mkdir %DATADIR%

xcopy %SRC_DIR%\lib\mpl_toolkits\basemap\data\*_i.dat %DATADIR% /s /e || exit 1
xcopy %SRC_DIR%\lib\mpl_toolkits\basemap\data\*_h.dat %DATADIR% /s /e || exit 1
xcopy %SRC_DIR%\lib\mpl_toolkits\basemap\data\*_f.dat %DATADIR% /s /e || exit 1
xcopy %SRC_DIR%\lib\mpl_toolkits\basemap\data\UScounties.* %DATADIR% /s /e || exit 1
