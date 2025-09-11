#!/usr/bin/env bash

# Find name based on appimage name inside directory
FILE=$(find "$HOME"/.local/share/applications -name "*$1.desktop")
#echo "$FILE"
AUTOSTART_DIR="$HOME"/.config/autostart
#echo "$AUTOSTART_DIR"

# concatenate current .desktop file with autostart directory
trimmed=$(echo "$FILE" | sed 's/\/home.*applications\///')
current_file="$AUTOSTART_DIR/$trimmed"

# check if that file exists
if [ -e "$current_file" ]; then
    echo "same application already exists in directory"
    exit
else
    # remove prior versions in autostart directory
    rm "$AUTOSTART_DIR"/*todoist.desktop
    # copy FILE to autostart
    cp "$FILE" "$AUTOSTART_DIR"
fi



## dconf write addition to favorite-apps
#
#trimmed=$(echo "$FILE" | sed 's/\/home.*applications\///')
#
#trimmed=", '$trimmed']"
#
#current_list=$(dconf read /org/gnome/shell/favorite-apps)
#
##echo "$trimmed"
##echo "$current_list"
#dconf write /org/gnome/shell/favorite-apps \""${current_list/"']"/$trimmed}"\"
##echo dconf write /org/gnome/shell/favorite-apps \""${current_list/"']"/$trimmed}"\"
