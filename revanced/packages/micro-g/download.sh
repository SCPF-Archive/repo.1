#!/bin/bash

echo "DOWNLOADING MICROG"
MICROG_REPO="inotia00/VancedMicroG"
MICROG_ASSETS=".apk"
wget --progress=dot:mega $(curl -s "https://api.github.com/repos/"$MICROG_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${MICROG_ASSETS}"'")) | .browser_download_url')
