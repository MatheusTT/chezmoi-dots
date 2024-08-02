#!/usr/bin/env bash

EWW="$HOME/.local/bin/eww -c $HOME/.config/eww"
mapfile -t WINDOWS <<< "$(${EWW} active-windows | awk -F: '{print $1}' | sed '/^bar/d')"

close_windows() {
  for window in "${WINDOWS[@]}"; do
    if [[ "$window" != "$1" ]]; then
      if [[ "$window" =~ "${WINDOWS[@]}" ]]; then
        ${EWW} close "${window}"
      fi
    fi
  done
}

if ( ! grep -q "$1" <<< "${WINDOWS[@]}" ); then
  [[ -n "${WINDOWS[@]}" ]] && close_windows "$1"
  ${EWW} open "$1"
else
  ${EWW} close "$1"
fi
