@echo off
if "%1" == "o" cd /d %HOMEROOT%\tools
if "%1" == "" cd /d %HOMEROOT%
if "%1" == "m" cd /d %HOMEROOT%\mapbg
if "%1" == "v" cd /d %HOMEROOT%\vcpkg
if "%1" == "l" cd /d %HOMEROOT%\lego
if "%1" == "p" cd /d %HOMEROOT%\lego\partmake
