@echo off
setlocal

REM ====== Steam SOURCE folder ======
set "SOURCE=C:\Program Files (x86)\Steam\steamapps\common\Kerbal Space Program\saves"

REM ====== DESTINATION (saves folder where this BAT is located) ======
set "DEST=%~dp0saves"
set "BACKUP=%~dp0old_saves"

echo.
echo Backing up the old saves folder...
echo Source:    %SOURCE%
echo Destination: %DEST%
echo Backup:   %BACKUP%
echo.

REM If there is already an old_saves folder, delete it first
if exist "%BACKUP%" (
    echo Deleting previous backup folder...
    rmdir /s /q "%BACKUP%"
)

REM If the saves folder exists, rename it
if exist "%DEST%" (
    echo Renaming current "saves" to "old_saves"...
    ren "%DEST%" "old_saves"
)

REM Now copy the new one
echo Copying new saves...
xcopy "%SOURCE%" "%DEST%" /e /i /h /y

echo.
echo Done!
pause