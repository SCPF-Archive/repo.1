#!/bin/bash

WGET_HEADER="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"

GETAPK=$(curl -s https://apkflash.com/apk/app/com.myprog.hexedit/hex-editor/download | grep -i "https://download.apkflash.com/com.myprog.hexedit/hex-editor" | cut -b 25- | awk '{print $1}' | tr -d '"')
wget --progress=dot:mega --header="$WGET_HEADER" "$GETAPK" -O com.myprog.hexedit.apk
