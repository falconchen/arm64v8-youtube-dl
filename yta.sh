#!/bin/ash
localDir=/mnt/sda3/Youtube/audio/`date +"%Y-%m-%d"`
mkdir -p ${localDir} 2>/dev/null
docker run -i --rm -v ${localDir}:/data falconchen/arm64v8-youtube-dl -f bestaudio $@
