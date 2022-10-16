@echo off

rem Chocolatey installation and configuration

rem This will return ERRORLEVEL 1 if Choco is installed
@choco
if "%ERRORLEVEL%"=="1" (
	echo Chocolatey is already installed!
	goto done
)

echo Trying to install Chocolatey...
powershell.exe -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

echo Refreshing environmental variables
call refreshenv

echo Modifying the Chocolatey settings
choco feature enable -n=useRememberedArgumentsForUpgrades
choco feature enable -n=exitOnRebootDetected
choco feature enable -n=allowEmptyChecksums
choco feature enable -n=allowGlobalConfirmation

echo Done!
goto done

:done
pause
exit
