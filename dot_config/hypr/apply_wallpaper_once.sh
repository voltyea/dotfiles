#!/bin/bash

flag=$HOME/.config/hypr/set_wallpaper_once.flag
wallpaper_path=$HOME/wallpapers/Raiden_shogun.png

if [ -f "$flag" ] && [ -f "$wallpaper_path" ]; then
  swww img "$wallpaper_path"
  rm "$flag" # prevent it from running again
fi
