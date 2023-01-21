#!/bin/bash

APKURL=$(curl -s https://spotify.en.uptodown.com/android/download | grep -i "dw.uptodown.com/dwn" | cut -b 10- | tr -d '"')
wget --progress=dot:mega --random-wait "$APKURL" -O com.spotify.music.apk
