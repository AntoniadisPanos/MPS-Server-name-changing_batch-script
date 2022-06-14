@Echo off
setlocal enabledelayedexpansion
set "persistent= /PERSISTENT:YES"
set "findtext=\\SDMGRCPSRCFL001"
set "findtext2=\\filvapsdmi"
set "srcfile=C:\SAPFILES1\shares.txt"
set "destfile=C:\SAPFILES1\finalshares.txt"
set "destfile2=C:\SAPFILES1\finalshares2.txt"
set "remstring=Microsoft Windows Network"
IF NOT Exist "C:\SAPFILES1" GOTO :CreateFolder
IF Exist "C:\SAPFILES1" GOTO :Continue

:CreateFolder
MD C:\SAPFILES1
Echo Folder "SAPFILES1" was created.

:Continue
net use > %srcfile%

(for /f "delims=," %%b in ('type %srcfile% ^|findstr "%findtext% %findtext2%"') do @echo %%b) > %destfile%

(FOR /F "delims=" %%G IN (%destfile%) DO (
        set line=%%G
        @echo !line:%remstring%=!
    )
) > %destfile2%

for /f "tokens=2,3" %%a in ('type %destfile2%') do (call :unmap %%a %%b)

:unmap
set var=%1
net use %var% /delete
endlocal























