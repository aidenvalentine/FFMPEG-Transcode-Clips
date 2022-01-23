@echo off
:again

set watermark=X:\Distribution\Assets\WorshipAnastasia.com\WorshipAnastasia.com-logo_1080x1920.png

rem 4K MP4 | Slow = hq 2 pass
ffmpeg -i %~1 -i %watermark% -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.7[logotransparent];[logotransparent][0]scale2ref=0:0[logo][video];[video][logo]overlay=0:0;[a:0][a:1]amerge=inputs=2[ch1ch2]" -map v:0 -map [ch1ch2] -c:v hevc_nvenc -rc vbr -s 3840x2160 -profile:v main -acodec aac -ab 128k -ar 48000 -ac 2 -b:v 10M -maxrate:v 18M -preset slow -pix_fmt yuv444p %~n1_4k_anastasia.mp4

rem 1080p MP4
ffmpeg -i %~1 -i %watermark% -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.7[logotransparent];[logotransparent][0]scale2ref=0:0[logo][video];[video][logo]overlay=0:0;[a:0][a:1]amerge=inputs=2[ch1ch2]" -map v:0 -map [ch1ch2] -c:v h264_nvenc -s 1920:1080 -profile:v main -level:v 4.2 -acodec aac -ab 128k -ar 48000 -ac 2 -b:v 6M -preset slow -rc vbr %~n1_hd_anastasia.mp4

rem 480p MP4
ffmpeg -i %~1 -i %watermark% -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.7[logotransparent];[logotransparent][0]scale2ref=0:0[logo][video];[video][logo]overlay=0:0;[a:0][a:1]amerge=inputs=2[ch1ch2]" -map v:0 -map [ch1ch2] -c:v h264_nvenc -s 720:480 -profile:v main -level:v 3.0 -acodec aac -ab 64k -ar 48000 -ac 2 -b:v 2.5M -rc vbr %~n1_sd_anastasia.mp4

rem 1080p WMV
ffmpeg -i %~1 -i %watermark% -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.7[logotransparent];[logotransparent][0]scale2ref=0:0[logo][video];[video][logo]overlay=0:0;[a:0][a:1]amerge=inputs=2[ch1ch2]" -map v:0 -map [ch1ch2] -s 1920x1080 -b:v 6M -vcodec wmv2 -acodec wmav2 -ab 128k -ar 48000 -ac 2 %~n1_hd_anastasia.wmv

rem Beep when done
rundll32.exe cmdext.dll,MessageBeepStub

shift
if “%~1” == “” goto:eof
goto:again
exit
