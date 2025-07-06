#!/bin/bash

while ! swww query &>/dev/null; do
  sleep 0.5
done

nwg-dock-hyprland -d -hd 150 -p "right" -mr 10 -i 40 &
