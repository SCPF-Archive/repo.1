#!/bin/bash

echo "SET WGET HEADER"
WGET_HEADER="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"

echo "DOWNLOADING MICROG"
MICROG_REPO="inotia00/VancedMicroG"
MICROG_ASSETS=".apk"
wget --progress=dot:mega --header="$WGET_HEADER" $(curl -s "https://api.github.com/repos/"$MICROG_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${MICROG_ASSETS}"'")) | .browser_download_url')
