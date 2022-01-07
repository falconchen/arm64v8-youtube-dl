#!/bin/ash
echo $PATH

localDir=/mnt/sda4/course
echo $localDir
mkdir -p ${localDir} 2>/dev/null
docker run -i --rm -v ${localDir}:/data falconchen/arm64v8-yt-dlp -o "/data/%(channel)s/%(title)s.%(ext)s" $@
