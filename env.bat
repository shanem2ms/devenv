@echo off
call :getHomeRoot

set PATH=%HOMEROOT%\tools;%HOMEROOT%\tools\win32;%PATH%;C:\Windows\SysWOW64
set DMROOT=%HOMEROOT%\..\DigitalMedia

echo //////////////////////////////////////////////////////////
echo //                                                      //
echo //                Home Build Environment                  //
echo //                                                      //
echo //                                                      //
echo //////////////////////////////////////////////////////////
echo .
echo Type "build" to build

SET KUBECONFIG=C:\Users\wsiadmin\.bluemix\plugins\container-service\clusters\dmserver\kube-config-wdc04-dmserver.yml



:getHomeRoot
FOR /F "tokens=* USEBACKQ" %%F IN (`cd`) DO (
SET var=%%F
)
set mydir="%var%"
SET mydir=%mydir:\=;%
set HOMEROOT=
set VCPKG_DEFAULT_TRIPLET=x64-windows

for /F "tokens=* delims=;" %%i IN (%mydir%) DO call :LAST_FOLDER %%i
goto :EOF

:LAST_FOLDER	
if "%HOMEROOT%" == "" (set HOMEROOT=%1) else (set HOMEROOT=%HOMEROOT%\%1)
if /I "%1"=="homep4" (
    goto :ENDPRINT
)

SHIFT

goto :LAST_FOLDER

:ENDPRINT

set PATH=%PATH%;%HOMEROOT%\vcpkg
call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"

EXIT /B 0


