@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem Process master file

:choice
set /P c=Do you want to transcode versions for Anastasia[Y/N]?
if /I "%c%" EQU "Y" goto :xxxmultimediaandanastasia
if /I "%c%" EQU "N" goto :xxxmultimedia
goto :choice

:xxxmultimedia

rem echo "I am here because you typed Y"
rem Transcode Clips
call V:\Tools\ffmpeg-transcode-clips.bat %~1

rem Transcode HQ VOD
call V:\Tools\ffmpeg-transcode-clips-VOD.bat %~1

rem Generate Contact Sheets

rem exit
goto:eof

:xxxmultimediaandanastasia

rem echo "I am here because you typed Y"
rem Transcode Clips
call V:\Tools\ffmpeg-transcode-clips.bat %~1

rem Transcode Clips for Anastasia
call V:\Tools\ffmpeg-transcode-clips_anastasia.bat %~1

rem Transcode HQ VOD
call V:\Tools\ffmpeg-transcode-clips-VOD.bat %~1

rem Generate Contact Sheets

goto:end

:end

rem Beep when done
rem rundll32.exe cmdext.dll,MessageBeepStub
rem exit