#!/usr/bin/env bash

get-out() {
  # amixer -D pulse sget Master | awk -F'[][]' '/Left:/ { print $2 }' | tr -d '%'
  amixer -D pulse get Master | awk '/Left:/ {print $5}' | tr -d '[]%'
}

get-player() {
  playerctl --player=spotify metadata --format '{{volume * 100}}' | cut -d'.' -f1
}

set-out() {
  pactl set-sink-volume @DEFAULT_SINK@ "$1"
}

set-player() {
  playerctl --player=spotify volume "0.$1"
}

#set-player() {
#  if [[ "$1" = "up" ]]; then
#    playerctl --player=spotify volume 0.01+
#  else
#    playerctl --player=spotify volume 0.01-
#  fi
#}

"$@"
