#!/bin/bash

sudo pacman -S --needed git

git clone https://github.com/voltyea/hyprland.git $HOME/hyprland/
cd $HOME/hyprland/
sudo chmod +x install.sh
./install.sh
