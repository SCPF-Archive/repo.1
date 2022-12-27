#!/bin/bash

declare -A apks

apks["com.awedea.nyx.apk"]="https://nyx-music-player.en.uptodown.com/android/download"

WGET_HEADER="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"

get_apk_download_url()
{
    version_url=$(curl -s "$1" | jq ".data[] | select(.version | contains(\"$2\")) | .versionURL")
    dl_url=$(curl -s "${version_url:1:-1}" | grep -oE "https:\/\/dw\.uptodown\.com.+\/")
    echo "$dl_url"
}

for apk in "${!apks[@]}"; do
    if [ ! -f $apk ]; then
        echo "Downloading $apk"
        dl_url=$(curl -s "${apks[$apk]}" | grep -oE "https:\/\/dw\.uptodown\.com.+\/")
        curl -sLo "$apk" "$dl_url"
    fi
done
