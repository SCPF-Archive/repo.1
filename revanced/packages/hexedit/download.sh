#!/bin/bash

WGET_HEADER="User-Agent: Mozilla/5.0 (Linux; Android 9; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36"

GETAPK=$(curl -s https://apkflash.com/apk/app/com.myprog.hexedit/hex-editor/download | grep -i "https://download.apkflash.com/com.myprog.hexedit/hex-editor" | cut -b 25- | awk '{print $1}' | tr -d '"')
wget --progress=dot:mega --header="$WGET_HEADER" "$GETAPK" -O com.myprog.hexedit.apk
