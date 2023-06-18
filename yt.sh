#!/bin/ash

#echo $PATH
if [ -z "$localDir" ]; then
  localDir="/mnt/sda3/Youtube/video/$(date +'%Y-%m-%d')"
fi

if [ ! -d "$localDir" ]; then
  mkdir -p "$localDir"
fi

#localDir=/mnt/sda3/Youtube/video/`date +"%Y-%m-%d"`
#echo $localDir
#mkdir -p ${localDir} 2>/dev/null
docker run -i --rm -v ${localDir}:/data falconchen/arm64v8-yt-dlp -f '(bv*[vcodec^=vp9][height<=1024]+ba[acodec=opus])/137+ba[ext=m4a]/137+ba/302+ba[ext=m4a]/302+ba/bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo[ext=mp4]+(258/256/140)/bestvideo[ext=webm]+(250/249)/bestvideo[ext=webm]+bestaudio/mp4/best' --embed-subs $@
