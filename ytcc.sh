#!/bin/ash
#echo "[path] " $PATH

localDir=/mnt/sda4/course
echo "[target] "$localDir
mkdir -p ${localDir} 2>/dev/null
docker run -i --rm -v ${localDir}:/data falconchen/arm64v8-yt-dlp -o "/data/%(channel)s/%(title)s.%(ext)s" $@
