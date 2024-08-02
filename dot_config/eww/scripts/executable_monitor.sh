#!/usr/bin/env bash

mapfile -t MONITORS <<< "$(xrandr | awk '/\(/ { print $1 }')"
PRIMARY=${MONITORS[0]}
SECONDARY=${MONITORS[1]}

if (xrandr --listactivemonitors | grep -wq "$SECONDARY"); then
  case "$1" in
    left|l)
      xrandr --output "$SECONDARY" --left-of  "$PRIMARY"
      bspc wm --reorder-monitors HDMI-A-0 eDP
      echo "--left-of" > "$XDG_CACHE_HOME/scripts/monitor_position"
      ;;
    right|r)
      xrandr --output "$SECONDARY" --right-of "$PRIMARY"
      bspc wm --reorder-monitors eDP HDMI-A-0
      echo "--right-of" > "$XDG_CACHE_HOME/scripts/monitor_position"
      ;;
    mirror|m)
      xrandr --output "$SECONDARY" --same-as  "$PRIMARY"
      echo "--same-as" > "$XDG_CACHE_HOME/scripts/monitor_position"
      ;;
  esac
else
  notify-send "$SECONDARY is not connected."
fi
"$HOME"/.config/eww/scripts/pop.sh monitor
