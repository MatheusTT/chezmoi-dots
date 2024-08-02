#!/usr/bin/env bash

BATTERY="BAT0"
BATTERY_STATUS=$(cat /sys/class/power_supply/${BATTERY}/status)
BATTERY_CAPACITY=$(cat /sys/class/power_supply/${BATTERY}/capacity)
IPMAN_STATUS=$(ipman --status | awk '{ print $3 }')

get-color() {
  if [[ "$BATTERY_STATUS" == "Discharging" ]]; then
    if [[ $BATTERY_CAPACITY -lt 20 ]]; then
      COLOR="#f7768e"
    else
      COLOR="#e0af68"
    fi
  else
    COLOR="#9ece6a"
  fi
  echo "$COLOR"
}

get-icon() {
  if [[ $BATTERY_CAPACITY -lt 25 ]]; then
    ICON="󰁼"
  elif [[ $BATTERY_CAPACITY -le 50 ]]; then
    ICON="󰁾"
  elif [[ $BATTERY_CAPACITY -lt 75 ]]; then
    ICON="󰂀"
  elif [[ $BATTERY_CAPACITY -lt 100 ]]; then
    ICON="󰂂"
  else
    ICON="󰁹"
  fi
  echo $ICON
}

get-status() {
  if [[ $BATTERY_STATUS != "Unknown" ]]; then
    STATUS=$BATTERY_STATUS
  else
    if [[ $IPMAN_STATUS == "ENABLED" ]]; then
      STATUS="Full"
    fi
  fi
  echo $STATUS
}

"$@"