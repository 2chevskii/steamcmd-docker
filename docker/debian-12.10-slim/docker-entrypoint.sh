#!/bin/sh

set -e

if [ -d "/docker-entrypoint.d" ] && [ "$(ls -A /docker-entrypoint.d)" ]; then
  echo "/docker-entrypoint.d is not empty, running scripts"
  for script in /docker-entrypoint.d/*; do
    [ -f "$script" ] || continue
    echo "Running $script"
    "/steamcmd/steamcmd.sh" +runscript "$script" +quit
  done
fi

echo "Starting SteamCMD"
exec "/steamcmd/steamcmd.sh" "$@"
