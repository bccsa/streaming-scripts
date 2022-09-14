title sTVlive STREAMING - Video

:: Encode vMix multi-lingual output to multiple bitrates, and push SRT stream to Nimble Streamer
:: =============================================================================================
:: The video stream is mapped 6 times for 6 different video qualities
:: The audio streams are mapped two times per stream for two different audio qualities.
:: Stream layout:
:: video_720p
:: video_540p
:: video_480p (actual aspect ratio is 450x800)
:: video_360p
:: video_240p (actual aspect ratio is 270x480)
:: video_180p
:: audio_ch0      MUL stereo (Untranslated)
:: audio_ch0_mono MUL mono (Untranslated)
:: audio_ch1      ENG stereo (English)
:: audio_ch1_mono ENG mono (English)
:: audio_ch1      FRA stereo (French)
:: audio_ch1_mono FRA mono (French)
:: audio_ch1      NYA stereo (Nyanja / Chichewa)
:: audio_ch1_mono NYA mono (Nyanja / Chichewa)
:: audio_ch1      SWA stereo (Swahili)
:: audio_ch1_mono SWA mono (Swahili)

ffmpeg\ffmpeg.exe -rtbufsize 2048M -threads 4 ^
-f dshow -copyts -i video="vMix Video":audio="vMix Audio" ^
-f dshow -copyts -i audio="vMix Audio - Bus A" ^
-f dshow -copyts -i audio="vMix Audio - Bus B" ^
-f dshow -copyts -i audio="vMix Audio - Bus C" ^
-f dshow -copyts -i audio="vMix Audio - Bus D" ^
-filter_complex "[0:v]split=6[video0][video1][video2][video3][video4][video5]" ^
-filter_complex "[0:a]asplit=2[audio0_0][audio0_1]" ^
-filter_complex "[1:a]asplit=2[audio1_0][audio1_1]" ^
-filter_complex "[2:a]asplit=2[audio2_0][audio2_1]" ^
-filter_complex "[3:a]asplit=2[audio3_0][audio3_1]" ^
-filter_complex "[4:a]asplit=2[audio4_0][audio4_1]" ^
-map "[video0]" -map "[video1]" -map "[video2]" -map "[video3]" -map "[video4]" -map "[video5]" ^
-map "[audio0_0]" -map "[audio0_1]" ^
-map "[audio1_0]" -map "[audio1_1]" ^
-map "[audio2_0]" -map "[audio2_1]" ^
-map "[audio3_0]" -map "[audio3_1]" ^
-map "[audio4_0]" -map "[audio4_1]" ^
-codec:v:0 libx264 -s:v:0 1280x720 -pix_fmt:v:0 yuv420p -bufsize:v:0 3000k -g:v:0 50 -preset:v:0 veryfast -profile:v:0 baseline -level:v:0 3.1 -b:v:0 3000k -maxrate:v:0 3700k -aspect 16:9 ^
-codec:v:1 libx264 -s:v:1 960x540  -pix_fmt:v:1 yuv420p -bufsize:v:1 1500k -g:v:1 50 -preset:v:1 veryfast -profile:v:1 baseline -level:v:1 3.1 -b:v:1 1500k -maxrate:v:1 1650k -aspect 16:9 ^
-codec:v:2 libx264 -s:v:2 800x450  -pix_fmt:v:2 yuv420p -bufsize:v:2 850k  -g:v:2 50 -preset:v:2 veryfast -profile:v:2 baseline -level:v:2 3.1 -b:v:2 850k  -maxrate:v:2 935k  -aspect 16:9 ^
-codec:v:3 libx264 -s:v:3 640x360  -pix_fmt:v:3 yuv420p -bufsize:v:3 350k  -g:v:3 50 -preset:v:3 veryfast -profile:v:3 baseline -level:v:3 3.1 -b:v:3 350k  -maxrate:v:3 385k  -aspect 16:9 ^
-codec:v:4 libx264 -s:v:4 480x270  -pix_fmt:v:4 yuv420p -bufsize:v:4 160k  -g:v:4 50 -preset:v:4 veryfast -profile:v:4 baseline -level:v:4 3.1 -b:v:4 160k  -maxrate:v:4 180k  -aspect 16:9 ^
-codec:v:5 libx264 -s:v:5 320x180  -pix_fmt:v:5 yuv420p -bufsize:v:5 100k  -g:v:5 50 -preset:v:5 veryfast -profile:v:5 baseline -level:v:5 3.1 -b:v:5 100k  -maxrate:v:5 120k  -aspect 16:9 ^
-codec:a:0 aac -b:a:0 128k -ac:a:0 2 ^
-codec:a:1 aac -b:a:1 64k  -ac:a:1 1 ^
-codec:a:2 aac -b:a:2 128k -ac:a:2 2 ^
-codec:a:3 aac -b:a:3 64k  -ac:a:3 1 ^
-codec:a:4 aac -b:a:4 128k -ac:a:4 2 ^
-codec:a:5 aac -b:a:5 64k  -ac:a:5 1 ^
-codec:a:6 aac -b:a:6 128k -ac:a:6 2 ^
-codec:a:7 aac -b:a:7 64k  -ac:a:7 1 ^
-codec:a:8 aac -b:a:8 128k -ac:a:8 2 ^
-codec:a:9 aac -b:a:9 64k  -ac:a:9 1 ^
-f mpegts "srt://10.9.1.15:1235?pkt_size=1316"

