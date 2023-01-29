#!/bin/bash

echo "DOWNLOADING MICROG"
wget --progress=dot:mega --random-wait $(curl -s "https://api.github.com/repos/inotia00/VancedMicroG/releases/latest" | jq -r '.assets[] | select(.name | contains("'.apk'")) | .browser_download_url')
