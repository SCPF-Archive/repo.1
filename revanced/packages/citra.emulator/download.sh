#!/bin/bash

declare -A apks

apks["org.citra.citra_emu.apk"]="https://citra-emulator-3ds-emulator.en.uptodown.com/android/download"

get_apk_download_url()
{
    version_url="$(curl -s "$1" | jq ".data[] | select(.version | contains(\"$2\")) | .versionURL")"
    dl_url="$(curl -s "${version_url:1:-1}" | grep -oE "https:\/\/dw\.uptodown\.com.+\/")"
    echo "$dl_url"
}

for apk in "${!apks[@]}"; do
    if [ ! -f "$apk" ]; then
        echo "Downloading $apk"
        dl_url="$(curl -s "${apks[$apk]}" | grep -oE "https:\/\/dw\.uptodown\.com.+\/")"
        curl -sLo "$apk" "$dl_url"
    fi
done
