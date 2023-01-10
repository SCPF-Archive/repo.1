#!/bin/bash

echo "DOWNLOADING REVANCED MANAGER"
wget -nv --random-wait  $(curl -s "https://api.github.com/repos/revanced/revanced-manager/releases/latest" | jq -r '.assets[] | select(.name | contains("'.apk'")) | .browser_download_url')
