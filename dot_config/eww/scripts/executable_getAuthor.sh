#!/usr/bin/env bash

TRACKID_PATH="$XDG_CACHE_HOME/spotify-covers/current_trackid"

inotifywait -m -e modify "$TRACKID_PATH" | while read -r _; do
  METADATA_PATH="$(cat "$TRACKID_PATH")/metadata"

  ARTIST=$(awk -v n=3 '/xesam:artist/ { for (i=n; i<=NF; i++) printf "%s%s", $i, (i<NF ? OFS : ORS)}' "$METADATA_PATH")
  AUTHOR=""
  if [[ -n "$ARTIST" ]]; then
    AUTHOR="$ARTIST"
  else
    ALBUM=$(awk -v n=3 '/xesam:album/ { for (i=n; i<=NF; i++) printf "%s%s", $i, (i<NF ? OFS : ORS)}' "$METADATA_PATH")
    [[ -n "$ALBUM" ]] && AUTHOR="$ALBUM"
  fi
  echo "${AUTHOR}" | sed 's/\s*$//'
done