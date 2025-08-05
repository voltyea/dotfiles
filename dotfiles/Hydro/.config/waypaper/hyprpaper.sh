#!/bin/bash

# Extract the full filename
filename=$(basename "$1")

# Extract the prefix (part before the first dot)
prefix="${filename%%.*}"

# Perform actions based on prefix
case "$prefix" in
anemo)
  rsync -r $HOME/.local/share/Elements/dotfiles/Anemo/ $HOME/
  # Add actual command here
  ;;

electro)
  rsync -r $HOME/.local/share/Elements/dotfiles/Electro/ $HOME/
  # Add actual command here
  ;;

*)
  echo "Unknown prefix '$prefix'. No action taken."
  ;;
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
