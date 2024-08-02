#!/usr/bin/env bash

## Eww path
CONFIG_PATH="$HOME/.config/eww"
EWW="/usr/bin/eww -c $CONFIG_PATH"

if [[ ! $(pidof eww) ]]; then
  ${EWW} daemon &
  sleep 0.25
  waybar &
else
  ${EWW} kill
  killall eww waybar
fi
