#!/usr/bin/env bash

XDG_CACHE_HOME=$HOME/.cache
CACHE_PATH="${XDG_CACHE_HOME}/spotify-covers"
[[ ! -d "${CACHE_PATH}" ]] && mkdir "${CACHE_PATH}"
pctl='playerctl --player=spotify'

$pctl metadata mpris:trackid --follow | while read -r TRACKID; do
  if [[ -z "$TRACKID" ]]; then
    echo "" > /tmp/current_trackid
  else 
    REAL_TRACKID="$(awk -F'/' '{print $NF}' <<< "${TRACKID}")"
    TRACKID_DIR="${CACHE_PATH}/${REAL_TRACKID}"
    if [[ ! -d "${TRACKID_DIR}" ]]; then
      mkdir "${TRACKID_DIR}"
      playerctl --player=spotify metadata > "${TRACKID_DIR}/metadata"
      ART_URL="$(awk '/mpris:artUrl/ {print $3}' "${TRACKID_DIR}/metadata")"
      echo $ART_URL
      wget "$ART_URL" -O "${TRACKID_DIR}/cover.png" &>/dev/null
    fi
    echo "$XDG_CACHE_HOME/spotify-covers/$REAL_TRACKID" > "$XDG_CACHE_HOME/spotify-covers/current_trackid"
  fi
done
