FROM debian:12.10-slim

ARG CREATION_TIME
ARG BRANCH
ARG COMMIT_HASH

LABEL org.opencontainers.image.title="SteamCMD"
LABEL org.opencontainers.image.description="SteamCMD Docker image based on Debian 12.10-slim"

LABEL org.opencontainers.image.created="$CREATION_TIME"

LABEL org.opencontainers.image.authors="dvchevskii@gmail.com"
LABEL org.opencontainers.image.url="https://github.com/2chevskii/steamcmd-docker"
LABEL org.opencontainers.image.source="https://github.com/2chevskii/steamcmd-docker.git"
LABEL org.opencontainers.image.vendor="2CHEVSKII"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.documentation="https://github.com/2chevskii/steamcmd-docker/wiki"

LABEL org.opencontainers.image.ref.name="$BRANCH"
LABEL org.opencontainers.image.revision="$COMMIT_HASH"

COPY /docker-entrypoint.sh /docker-entrypoint.sh
RUN mkdir /docker-entrypoint.d
RUN chmod +x /docker-entrypoint.sh

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends --no-install-suggests \
  ca-certificates \
  curl \
  lib32gcc-s1 \
  lib32stdc++6 \
  tar \
  gzip \
  locales

RUN rm -rf /var/lib/apt/lists/*
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=en_US.utf8

RUN apt-get update && apt-get autoclean -y && apt-get autoremove -y

WORKDIR /steamcmd

RUN curl -sSL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xzv

RUN ./steamcmd.sh +quit

ENTRYPOINT ["/docker-entrypoint.sh"]
