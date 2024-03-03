#!/bin/sh

# Usage:
# Open Terminal (Ctrl + Alt + T) and type:
# curl -sSf https://juanbanpar.github.io/GRADLOVE/amor.sh | sh

WallpaperURL="https://juanbanpar.github.io/GRADLOVE/files/wall.jpg"
MusicURL="https://juanbanpar.github.io/GRADLOVE/files/music.wav"
DownloadDirectory="/tmp"
WallFile=$(basename "$WallpaperURL")
MusicFile=$(basename "$MusicURL")

# Downloads SO MUCH LOVE
wget -P $DownloadDirectory $WallpaperURL
wget -P $DownloadDirectory $MusicURL

# Sets LOVE images
gsettings set org.gnome.desktop.background picture-uri file:///${DownloadDirectory}/${WallFile}

# Function to say LOUDLY how much I LOVE YOU
amixer -q set Master 50%

# Plays LOVE music
while [ 1 ] ; do
 aplay ${DownloadDirectory}/${MusicFile}
done
