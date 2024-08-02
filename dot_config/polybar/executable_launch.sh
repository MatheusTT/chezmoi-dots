#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Updates module (comment if not using Arch)
UPDATES_PATH="$XDG_CACHE_HOME/scripts/updates_available"
export TOTAL_PKGS="%{T5} %{T-}$(awk '/total/ { print $2 }' "$UPDATES_PATH")"
export PACMAN_PKGS="󰮯 $(awk '/pacman/ { print $2 }' "$UPDATES_PATH")"
export AUR_PKGS="󰣇 $(awk '/aur/ { print $2 }' "$UPDATES_PATH")"
export FLATPAK_PKGS="󰏗 $(awk '/flatpak/ { print $2 }' "$UPDATES_PATH")"

# Launch example bar
echo "---" | tee -a /tmp/polybar.log
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
