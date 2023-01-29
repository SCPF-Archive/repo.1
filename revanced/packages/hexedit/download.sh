#!/bin/bash

GETAPK=$(curl -s https://apkflash.com/apk/app/com.myprog.hexedit/hex-editor/download | grep -i "https://download.apkflash.com/com.myprog.hexedit/hex-editor" | cut -b 25- | awk '{print $1}' | tr -d '"')
CHECKIN=$(curl -s https://apkcombo.com/checkin)
DLAPK=$(echo "$GETAPK&$CHECKIN")
wget --progress=dot:mega "$DLAPK"
