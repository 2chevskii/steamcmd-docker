#!/bin/sh

set -e

CREATION_TIME=$(date -u --rfc-3339=ns | sed 's/\s/T/g')

echo "Building SteamCMD debian-12.10-slim image"
echo "Build time: $CREATION_TIME"
echo "Branch name: $GIT_REF_NAME"
echo "Commit hash: $GIT_SHA"

docker build \
  --build-arg "CREATION_TIME=$CREATION_TIME" \
  --build-arg "BRANCH_NAME=$GIT_REF_NAME" \
  --build-arg "COMMIT_HASH=$GIT_SHA" \
  -t ghcr.io/2chevskii/steamcmd:debian-12.10-slim \
  -t ghcr.io/2chevskii/steamcmd:latest \
  -t "ghcr.io/2chevskii/steamcmd:$GIT_SHA" \
  -t docker.io/2chevskii/steamcmd:debian-12.10-slim \
  -t docker.io/2chevskii/steamcmd:latest \
  -t "docker.io/2chevskii/steamcmd:$GIT_SHA" \
  .
