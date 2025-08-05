#!/bin/bash

# Extract the full filename
filename=$(basename "$1")

# Extract the prefix (part before the first dot)
prefix="${filename%%.*}"

# Perform actions based on prefix
case "$prefix" in
Anemo)
  rsync -r $HOME/.local/share/Elements/dotfiles/Anemo/ $HOME/
  sudo mkdir -p /etc/sddm.conf.d/
  sudo rsync $HOME/.local/share/Elements/sddm/Anemo/sddm.conf /etc/sddm.conf.d/
  sudo rsync -r $HOME/.local/share/Elements/sddm/Anemo/Anemo/ /usr/share/sddm/themes/
  ;;

Electro)
  rsync -r $HOME/.local/share/Elements/dotfiles/Electro/ $HOME/
  sudo mkdir -p /etc/sddm.conf.d/
  sudo rsync $HOME/.local/share/Elements/sddm/Electro/sddm.conf /etc/sddm.conf.d/
  sudo rsync -r $HOME/.local/share/Elements/sddm/Electro/Electro/ /usr/share/sddm/themes/
  ;;

Cryo)
  rsync -r $HOME/.local/share/Elements/dotfiles/Cryo/ $HOME/
  sudo mkdir -p /etc/sddm.conf.d/
  sudo rsync $HOME/.local/share/Elements/sddm/Cryo/sddm.conf /etc/sddm.conf.d/
  sudo rsync -r $HOME/.local/share/Elements/sddm/Cryo/Cryo/ /usr/share/sddm/themes/
  ;;

*) ;;
esac

# Define the filename (you can modify this path)
FILE="$HOME/.config/hypr/hyprpaper.conf"

NEW_WALLPAPER="$1"
WALLPAPER_RELATIVE="${NEW_WALLPAPER/#$HOME/\$HOME}"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf" # Change this to your actual config file path

# Escape forward slashes for use in sed
ESCAPED_WALLPAPER=$(printf '%s\n' "$WALLPAPER_RELATIVE" | sed 's:/:\\/:g')

# Replace lines in the config file
sed -i "s|^preload = .*|preload = $ESCAPED_WALLPAPER|" "$CONFIG_FILE"
sed -i "s|^wallpaper = ,.*|wallpaper = ,$ESCAPED_WALLPAPER|" "$CONFIG_FILE"
