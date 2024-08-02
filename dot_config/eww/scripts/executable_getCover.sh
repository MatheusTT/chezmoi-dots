#!/usr/bin/env bash

TRACKID_PATH="$XDG_CACHE_HOME/spotify-covers/current_trackid"

inotifywait -m -e modify "$TRACKID_PATH" | while read -r _; do
  COVER="$(cat "$TRACKID_PATH")/cover.png"
  [[ -n "$COVER" ]] && echo "$COVER" || echo ""
done