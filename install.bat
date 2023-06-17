@echo off

REM Elevates this script and enables delayed expansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/V:ON /c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )



call bin\installshit.bat
if !ERRORLEVEL! neq 0 call :warning Cannot install Chocolatey on this machine!

call bin\installshit2.bat
if !ERRORLEVEL! neq 0 call :warning Cannot install 1st part of packages

call bin\installshit3.bat
if !ERRORLEVEL! neq 0 call :warning Cannot install 2nd part of packages

call bin\installshit4.bat
if !ERRORLEVEL! neq 0 call :warning Cannot install 3rd part of packages

goto done

:warning
set vars=%*
echo WARNING: !vars! (EL: !ERRORLEVEL!)
goto quit

:error
set vars=%*
echo ERROR: !vars! (EL: !ERRORLEVEL!)
pause
goto terminate

:done
echo All is done for now. Quitting...
pause
goto terminate

:quit
exit /B

:terminate
exit
