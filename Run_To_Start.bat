@echo off
CLS
set currentpath=%cd%

ECHO.
ECHO ...............................................................
echo ....."Starting automatic file installation by chocolatey"......
echo .................."Run at your own risk".......................
ECHO ...............................................................
ECHO.
ECHO ...............................................................
echo ......."HAVE YOU RUN THIS SCRIPT AS AN ADMINISTRATOR?".........
echo ..........."This Script needs to run in admin mode"............
ECHO ...............................................................
ECHO.
ECHO ...............................................................
ECHO ............IF THIS IS YOUR FIRST TIME Press 1!................
ECHO ...............................................................
ECHO.
:MENU
ECHO ...............................................................
ECHO ..PRESS 1, 2, 3, 4, 5 OR 6 to select your task, or 7 to EXIT...
ECHO ...............................................................
ECHO.
ECHO 1 - Install Chocolatey
ECHO 2 - Install Standard Suite of Apps
ECHO 3 - Install Developer Suite of Apps
ECHO 4 - Install Media Suite of Apps
ECHO 5 - Install Light Suite of Apps
ECHO 6 - Install Complete Suite of Apps
ECHO 7 - Upgrade Apps
ECHO 8 - EXIT
ECHO.


SET /P M=Type 1, 2, 3, 4, 5, 6, 7 or 8 and then press ENTER:
IF %M%==1 GOTO FIR
IF %M%==2 GOTO GEN
IF %M%==3 GOTO DEV
IF %M%==4 GOTO MED
IF %M%==5 GOTO LTG
IF %M%==6 GOTO COM
IF %M%==7 GOTO UPG
IF %M%==8 GOTO EOF



REM Install Chocolatey
:FIR
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco feature enable -n allowGlobalConfirmation
choco upgrade chocolatey
ECHO ...............................................
ECHO A RESTART OF THE BATCH FILE IS MAYBE NECESSARY!!
ECHO ...............................................
ECHO ...............................................
GOTO MENU

:GEN
REM Standard Suite of Apps
choco install %~dp0\App_Lists\standardsuite.config
GOTO MENU

:DEV
REM Developer Suite of Apps
choco install %~dp0\App_Lists\developersuite.config
GOTO MENU

:MED
REM basic apps
choco install %~dp0\App_Lists\mediasuite.config
GOTO MENU

:COM
REM developer tools
choco install %~dp0\App_Lists\completesuite.config
GOTO MENU

:UPG
choco upgrade all
GOTO MENU

:LGT
REM Light Suite of Apps
choco install %~dp0\App_Lists\lightsuite.config
GOTO MENU

:EOF
