IF %ARCH% == 32 (
   pip install git+https://github.com/nwcell/psycopg2-windows.git@win32-py27#egg=psycopg2
) ELSE (
   pip install psycopg2==2.5.2
)
