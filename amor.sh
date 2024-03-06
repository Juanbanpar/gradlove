#!/bin/sh

# Usage:
# Open Terminal (Ctrl + Alt + T) and type:
# curl -sSf https://juanbanpar.github.io/GRADLOVE/amor.sh | sh

WallpaperURL="https://juanbanpar.github.io/GRADLOVE/files/wall.jpg"
GifURL="https://juanbanpar.github.io/GRADLOVE/files/heart-locket.gif"
MusicURL="https://juanbanpar.github.io/GRADLOVE/files/music.wav"
DownloadDirectory="/tmp"
WallFile=$(basename "$WallpaperURL")
GifFile=$(basename "$GifURL")
MusicFile=$(basename "$MusicURL")

# Downloads SO MUCH LOVE
wget -P $DownloadDirectory $WallpaperURL
wget -P $DownloadDirectory $GifURL
wget -P $DownloadDirectory $MusicURL

# Sets LOVE images
gsettings set org.gnome.desktop.background picture-uri file:///${DownloadDirectory}/${WallFile}

# Add to the clipboard LOVE gif
xclip -selection clipboard -t image/jpeg -i ${DownloadDirectory}/${GifFile}

# Open my favourite channel to express HOW MUCH LOVE I have
gnome-www-browser https://teams.microsoft.com/l/channel/19%3acd6d7b457ff84d86b3a182a310139597%40thread.tacv2/Random?groupId=1a0ebcf0-5300-494f-a968-317e4e6c7a42&tenantId=66102552-ecf2-44f2-aeee-14fa85460e0f

# Sleep 5 minutes to wait for the LOVER to be back at the computer
sleep 300

# Plays LOVE music
play_music() {
    while [ 1 ] ; do
        aplay ${DownloadDirectory}/${MusicFile}
    done
}

# Unmute our LOVE
amixer -D pulse sset Master on
# Function to say LOUDLY how much I LOVE YOU
# but increase volume by steps
increase_volume() {
    while [ 1 ] ; do
        sleep 1
        amixer -D pulse sset Master 2%+
    done
}

increase_volume | play_music
