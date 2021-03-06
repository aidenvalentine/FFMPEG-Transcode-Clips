# FFMPEG-Transcode-Clips
Use FFMPEG lib to Transcode MP4s &amp; WMVs from master files using NVIDIA NVENC hardware acceleration.

## Installation
1. Download [FFMPEG binaries](https://www.gyan.dev/ffmpeg/builds/). Extract the zip/7z archive, open the resulting folder, then save the /bin folder (containing ffmpeg.exe, ffprobe.exe, and ffplay.exe) to **C:\bin**.
1. [Add `C:\bin` to PATH environment variable on system](https://www.architectryan.com/2018/08/31/how-to-change-environment-variables-on-windows-10/).
1. Save the contents of this project to a folder on your filesystem.
1. **EDIT** line 7 of `/Add Context Menu - process-master.reg` to specify the directory on your filesystem where process-master.bat is saved.
1. Double-click to create a new Context Menu option when you right-click on a video file, to render it using our process-masters.bat and other batch files.
1. **Important** - If you don't have a NVIDIA GPU which supports [NVENC](https://help.elgato.com/hc/en-us/articles/360027954992-Which-NVIDIA-graphic-cards-do-support-NVENC-technology-) hardware acceleration, change `-c:v h264_nvenc` and `-c:v hevc_nvenc` to `-c:v libx264` or `-c:v libx265` respectively.

## Tips
1. Save these files to the **fastest** hard drive on your PC for best I/O performance, NVME is recommended.
1. Transcodes will be output into the same folder the master movie file is.
1. You can customize the **video bitrate**, **audio bitrate**, and other settings by editing the ffmpeg-transcode-clips batch scripts to suite your needs.
1. You may also drag-and-drop your master video files on the batch files to begin transcoding process.
1. Your watermark should be 1920x1080, and overlaid in a corner of the image in exactly the spot you'd like it to appear. Use a **transparent PNG** for this file.
