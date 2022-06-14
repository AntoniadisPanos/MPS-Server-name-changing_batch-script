@Echo off
setlocal enabledelayedexpansion
set "persistent= /PERSISTENT:YES"
REM set "findtext=\\SDMGRCPSRCFL001"
set "destfile2=C:\SAPFILES1\finalshares2.txt"


for /f "tokens=2,3" %%a in ('type %destfile2%') do (call :map %%a %%b)

:map
set var2=%1
set var3=%2
set med=!var3:~12!


set "init=\\SDMGRCPSRCFL001"
set sec=%init%%med%%persistent%
net use %var2% %sec%
endlocal
