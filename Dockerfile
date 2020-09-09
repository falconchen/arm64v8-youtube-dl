#
# Dockerfile for youtube-dl
#

FROM arm64v8/python:3-alpine
#FROM aarch64/python:3.5-alpine
MAINTAINER falcon <me@cellmean.com>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          openssl \
                          aria2 \
    && pip install --upgrade pip \
    && pip install youtube-dl \
    && mkdir -p /videos \
    && mkdir -p /audios

# Try to run it so we know it works
RUN youtube-dl --version

WORKDIR /data

VOLUME ["/videos"]
VOLUME ["/audios"]
ENTRYPOINT ["youtube-dl","-o","/videos/%(title)s.%(ext)s","--write-sub","--write-auto-sub","--sub-lang","en","--convert-subs","srt"]
CMD ["--help"]
