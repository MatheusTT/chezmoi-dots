#!/usr/bin/env bash

TRACKID_PATH="$XDG_CACHE_HOME/spotify-covers/current_trackid"

inotifywait -m -e modify "$TRACKID_PATH" | while read -r _; do
  METADATA_PATH="$(cat "$TRACKID_PATH")/metadata"
  TITLE="$(awk -v n=3 '/xesam:title/ { for (i=n; i<=NF; i++) printf "%s%s", $i, (i<NF ? OFS : ORS)}' "$METADATA_PATH")"
  [[ -n "$TITLE" ]] && echo "$TITLE" || echo " "
done
