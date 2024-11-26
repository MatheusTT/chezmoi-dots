#!/bin/sh

case $1 in
  get)  brightnessctl -m | awk -F, '{print $4}' ;;
  up)   brightnessctl set +5%                   ;;
  down) brightnessctl set 5%-                   ;;
esac