#!/bin/bash

entries="◄  Logout\n⏾  Suspend\n↻  Reboot\n⏻  Shutdown\n✖  Cancel"

selected=$(echo -e $entries|wofi --width 170 --height 230 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')
echo $selected

case $selected in
  logout)
    hyprctl dispatch exit 1;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
