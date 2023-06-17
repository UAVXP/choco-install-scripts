@echo off

REM Elevates this script and enables delayed expansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/V:ON /c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )



call test1\inner.bat
if !ERRORLEVEL! neq 0 call :warning Cannot install Chocolatey on this machine!

:warning
set vars=%*
echo WARNING: !vars! (EL: !ERRORLEVEL!)
pause
goto quit

:error
set vars=%*
echo ERROR: !vars! (EL: !ERRORLEVEL!)
pause
goto terminate

:quit
exit /B

:terminate
exit
