#!/bin/ash
#docker run -it --rm -v /mnt/sda3/Youtube/video/:/videos falconchen/aarch64-youtube-dl $@
docker run -i --rm -v /mnt/sda3/Youtube/video/:/videos falconchen/aarch64-youtube-dl $@
