#!/bin/bash

WallpaperURL="https://juanbanpar.github.io/GRADLOVE/files/wall.jpg"
DownloadDirectory="/home/$USER/amor"
WallFile=$(basename "$WallpaperURL")

# Sets LOVE images
gsettings set org.gnome.desktop.background picture-uri file:///${DownloadDirectory}/${WallFile}
