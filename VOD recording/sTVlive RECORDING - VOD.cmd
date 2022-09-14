title sTVlive RECORDING - VOD

:: Recording of multi-lingual, multi-bitrate SRT stream (pushed to Nimble streamer by sTVlive STREAMING - Video.cmd) to VOD ready file.
:: Recorded files can be uploaded to Nimble Streamer VOD folder for publishing directly after live event.

set year=%date:~0,4%
set month=%date:~5,2%
set day=%date:~8,2%
set hour=%time:~0,2%
set minute=%time:~3,2%

d:
cd "Video Recordings"

START "" Z:\05_Live_Production\01_Templates\05_Program_Control\01_ffmpeg_scripts\generate_smil.cmd %year%%month%%day%_%hour%%minute%_VOD.mp4 %year%%month%%day%_%hour%%minute%_VOD.smil


Z:\05_Live_Production\01_Templates\05_Program_Control\01_ffmpeg_scripts\ffmpeg\ffmpeg.exe -y -f mpegts -i "srt://10.9.1.15:1236?latency=2000" ^
-map 0:0  -map 0:1 -map 0:2 -map 0:3 -map 0:4 -map 0:5 ^
-map 0:6  -map 0:7 ^
-map 0:8  -map 0:9 ^
-map 0:10 -map 0:11 ^
-map 0:12 -map 0:13 ^
-map 0:14 -map 0:15 ^
"%year%%month%%day%_%hour%%minute%_VOD.mp4"
