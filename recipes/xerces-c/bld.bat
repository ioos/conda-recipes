:: Need to move a more current msbuild into PATH.  32-bit one in particular on AppVeyor barfs on the solution
::     This one comes from the Win7 SDK (.net 4.0), and is known to work.
if %ARCH% == 64 (
    set PLATF=x64
    set OUTDIR=Win64
) else (
    if %VS_MAJOR% == 9 (
        COPY C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe .\
        set "PATH=%CD%;%PATH%"
    )
    set PLATF=Win32
    set OUTDIR=Win32
)

set XERCESVC=VC%VS_MAJOR%
set XERCESSOLUTION=projects\Win32\%XERCESVC%\xerces-all\xerces-all.sln

if not exist %XERCESSOLUTION% (
    :: see https://github.com/conda/conda-build/wiki/Windows-recipe-patterns#updating-older-sln-files
    :: Upgrade the VC9 version - got weird errors with VC12
    :: I should be able to update XERCESVC above, but it doesn't work for me !?
    devenv.exe projects\Win32\VC9\xerces-all\xerces-all.sln /Upgrade
    if errorlevel 1 exit 1
    msbuild projects\Win32\VC9\xerces-all\xerces-all.sln /t:XercesLib /p:Configuration=Release;Platform=%PLATF%
    if errorlevel 1 exit 1

    :: implib and DLL - this method puts it in a different place?!
    copy projects\Win32\VC9\xerces-all\XercesLib\%OUTDIR%\xerces-c_3.lib %LIBRARY_LIB%
    if errorlevel 1 exit 1
    copy projects\Win32\VC9\xerces-all\XercesLib\%OUTDIR%\xerces-c_3_1.dll %LIBRARY_BIN%
    if errorlevel 1 exit 1
) else (
    msbuild %XERCESSOLUTION% /t:XercesLib /p:Configuration=Release;Platform=%PLATF%
    if errorlevel 1 exit 1

    :: implib and DLL
    copy Build\%OUTDIR%\%XERCESVC%\Release\xerces-c_3.lib %LIBRARY_LIB%
    if errorlevel 1 exit 1
    copy Build\%OUTDIR%\%XERCESVC%\Release\xerces-c_3_1.dll %LIBRARY_BIN%
    if errorlevel 1 exit 1
)

:: Headers. Must be a better way...
echo .cpp > excludelist.txt
mkdir %LIBRARY_INC%\xercesc
xcopy /s /exclude:excludelist.txt src\xercesc %LIBRARY_INC%\xercesc
if errorlevel 1 exit 1
