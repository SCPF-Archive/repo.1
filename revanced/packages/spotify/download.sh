#!/bin/bash

curl -sL $(curl -s https://apkflash.com/apk/app/com.spotify.music/spotify/download | grep -i "https://download.apkflash.com/com.spotify.music/spotify_" | sort -u | grep -i "apkflash.com.apk" | cut -b 25- | awk '{print $1}' | tr -d '"') -o com.spotify.music.apk
