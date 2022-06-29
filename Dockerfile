#
# Docker for youtube-dl with ffmpeg supported
#

FROM python:3.10.0-slim
MAINTAINER falcon <me@cellmean.com>

RUN apt update -y \
    && apt install -y ffmpeg \
                          openssl \
    #&& pip install --upgrade pip \
    && python3 -m pip install --upgrade yt-dlp \
    && mkdir -p /videos \
    && mkdir -p /audios \
    && rm -rf /root/.cache/

#COPY ./youtube-dl.conf /etc/youtube-dl.conf
COPY ./yt-dlp.conf /etc/yt-dlp.conf

# Try to run it so we know it works
RUN yt-dlp --version

WORKDIR /data

VOLUME ["/data"]
ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
