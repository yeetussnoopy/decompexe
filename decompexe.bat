@echo off
setlocal

set "sourceFolder=%~dp0"

set /p exeName=Enter the name of the exe file: 

set "newFileName%=%exeName%.exe"


set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"
if not exist "%sevenZipPath%" (
    echo 7-Zip not found at "%sevenZipPath%".
    echo Please update the path to your 7z.exe.
    pause
    exit /b 1
)

set "extractFolder=%sourceFolder%%exeName%_extracted"
mkdir "%extractFolder%" 2>nul

echo Extracting "%newFileName%" to "%extractFolder%"...
"%sevenZipPath%" x "%sourceFolder%%newFileName%" -o"%extractFolder%" -y

echo Done.
pause
endlocal