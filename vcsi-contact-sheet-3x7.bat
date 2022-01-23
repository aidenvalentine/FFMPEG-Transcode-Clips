@echo off
:again
rem vcsi %1 -t -w 1920 -g 4x4 --template vcsi.template
vcsi %1 -t -w 1567 -g 3x7 --start-delay-percent 0 --end-delay-percent 0 --metadata-position hidden


shift
if “%~1” == “” goto:eof
goto:again