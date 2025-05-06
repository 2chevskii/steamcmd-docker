FROM debian:12.10-slim

RUN useradd -m steam

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

USER steam:steam
WORKDIR /home/steam/steamcmd

RUN curl -sSL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xzv

RUN ./steamcmd.sh +quit

ENTRYPOINT ["/docker-entrypoint.sh"]
