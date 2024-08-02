#!/usr/bin/env bash

contains() {
  for i in $1; do
    [[ "$i" = "$2" ]] && true && return
  done
  false
}

workspace() {
  monitor="--monitor $1"
  icon="󰝥"
  buf=""
  desktops="$(bspc query -D --names $monitor)"
  focused_desktop="$(bspc query -D -d focused --names $monitor)"
  occupied_desktops="$(bspc query -D -d .occupied --names $monitor)"

  for ws in $desktops; do
    if contains "$focused_desktop" "$ws"; then
      class="focused"
    elif contains "$occupied_desktops" "$ws"; then
      class="occupied"
    else
      class="empty"
    fi

    buf="$buf (button :class \"workspaces_$class\" :onclick \"bspc desktop -f $ws\" \"$icon\")"
  done
  echo "(box :class \"workspaces\" :width \"155\" :halign \"center\" :valign \"center\" :vexpand true :hexpand true $buf)"
}


workspace eDP
bspc subscribe desktop_focus node_{add,remove,transfer} | while read -r _ ; do
  workspace eDP
done