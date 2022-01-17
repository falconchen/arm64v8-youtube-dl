# Docker for yt-dlp arm64v8 with ffmpeg supported

## download video demo
```
./yt.sh https://www.youtube.com/watch?v=Ljvlby3yZFQ

```

## download audio demo

```
./yta.sh https://www.youtube.com/watch?v=Ljvlby3yZFQ

```
## download audio and covert to mp3 format

```
./yta-mp3.sh https://www.youtube.com/watch?v=Ljvlby3yZFQ

```

## output

```
$ yt https://www.youtube.com/watch\?v\=lbxP8fEqLwI
[youtube] lbxP8fEqLwI: Downloading webpage
[youtube] lbxP8fEqLwI: Looking for automatic captions
WARNING: video doesn't have subtitles
WARNING: Couldn't find automatic captions for lbxP8fEqLwI
WARNING: Requested formats are incompatible for merge and will be merged into mkv.
[download] Destination: /data/每天挤地铁上班的他，终于崩溃了《丈夫得了抑郁症》_ 看电影了没.f137.mp4
[download] 100% of 244.41MiB in 01:2886MiB/s ETA 00:00142wn ETA
[download] Destination: /data/每天挤地铁上班的他，终于崩溃了《丈夫得了抑郁症》_ 看电影了没.f251.webm
[download] 100% of 14.87MiB in 00:0447MiB/s ETA 00:005
[ffmpeg] Merging formats into "/data/每天挤地铁上班的他，终于崩溃了《丈夫得了抑郁症》_ 看电影了没.mkv"
Deleting original file /data/每天挤地铁上班的他，终于崩溃了《丈夫得了抑郁症》_ 看电影了没.f137.mp4 (pass -k to keep)
Deleting original file /data/每天挤地铁上班的他，终于崩溃了《丈夫得了抑郁症》_ 看电影了没.f251.webm (pass -k to keep)
[ffmpeg] There aren't any subtitles to convert
```
