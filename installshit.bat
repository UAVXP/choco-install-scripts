@echo off

rem Chocolatey installation and configuration

set secondrun=%1

rem Re-run the script after the installation, so the choco envvar command should exist now
if "%secondrun%"=="" (
	powershell.exe -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

	rem	I think that should be enough
	start %0 1

	rem	runas /user:%COMPUTERNAME%\Administrator /savecred %0 1

	exit
)

choco feature enable -n=useRememberedArgumentsForUpgrades
choco feature enable -n=exitOnRebootDetected
choco feature enable -n=allowEmptyChecksums
choco feature enable -n=allowGlobalConfirmation

pause
exit
