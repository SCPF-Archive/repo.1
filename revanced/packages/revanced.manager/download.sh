#!/bin/bash

echo "DOWNLOADING REVANCED MANAGER"
MANAGER_REPO="revanced/revanced-cli"
MANAGER_ASSETS=".jar"
wget --progress=dot:mega $(curl -s "https://api.github.com/repos/"$MANAGER_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${MANAGER_ASSETS}"'")) | .browser_download_url')
