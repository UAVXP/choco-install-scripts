@echo off
set secondrun=%1

rem choco install javaruntime
rem choco install googlechrome steam-client notepadplusplus.install winscp putty.install winmerge k-litecodecpack-standard windirstat 7zip paint.net irfanview irfanviewplugins -y

rem powershell.exe -Command "cd %~dp0; Set-ExecutionPolicy Bypass -Scope Process -Force; .\chocolatey.ps1"

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
