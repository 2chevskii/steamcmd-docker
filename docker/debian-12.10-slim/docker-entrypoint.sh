#!/bin/sh

set -e

if [ -d "/docker-entrypoint.d" ] && [ "$(ls -A /docker-entrypoint.d)" ]; then
  echo "/docker-entrypoint.d is not empty, running scripts"
  for script in /docker-entrypoint.d/*; do
    [ -f "$script" ] || continue
    echo "Running $script"
    "/home/steam/steamcmd/steamcmd.sh" +runscript "$script" +quit
  done
fi

echo "Starting SteamCMD"
exec "/home/steam/steamcmd/steamcmd.sh" "$@"
