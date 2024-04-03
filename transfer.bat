@echo off
set source=%~dp0
@REM for example, 'D:\Development\fivem\servername\server-data\resources\[custom]\appname\'
set destination=

@echo building svelte

cd "%source%\svelte"
call npm run build
cd "%source%"

@echo cleaning up old files

del /Q "%destination%\client.lua"
del /Q "%destination%\server.lua"
del /Q "%destination%\config.lua"
del /Q "%destination%\fxmanifest.lua"
rmdir /S /Q "%destination%\html"


@echo copying files from %source% to %destination%

xcopy /Y "%source%\client.lua" "%destination%"
xcopy /Y "%source%\server.lua" "%destination%"
xcopy /Y "%source%\config.lua" "%destination%"
xcopy /Y "%source%\fxmanifest.lua" "%destination%"
xcopy /Y /E /I "%source%\html" "%destination%\html"

@echo done