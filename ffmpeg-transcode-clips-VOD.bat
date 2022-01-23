@echo off
setlocal EnableExtensions DisableDelayedExpansion
:again

rem Get master's bitrate using ffprobe
for /F "delims=" %%i in ('ffprobe.exe C:\Users\aiden\Videos\test.mxf -select_streams v:0 -v quiet -show_entries stream^=bit_rate -hide_banner -of default^=noprint_wrappers^=1:nokey^=1') do set /a videobitrate=%%i/1000000
rem echo %videobitrate%

rem 1080 VOD - No Watermark
ffmpeg -i %~1 -filter_complex "[a:0][a:1]amerge=inputs=2[ch1ch2]" -map v:0 -map [ch1ch2] -c:v h264_nvenc -b:v %videobitrate%M -s 1920:1080 -acodec aac -ab 320k -ar 48000 -ac 2 -pix_fmt yuv444p -rc cbr %~n1_vod.mp4

rem Beep when done
rundll32.exe cmdext.dll,MessageBeepStub

shift
if “%~1” == “” goto:eof
goto:again
exit
