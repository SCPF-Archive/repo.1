#!/bin/bash

wget --progress=dot:mega $(curl -s https://nyx-music-player.en.uptodown.com/android/download | grep -i "data-url" | cut -b 10- | tr -d '"')
mv *.apk com.awedea.nyx.apk
