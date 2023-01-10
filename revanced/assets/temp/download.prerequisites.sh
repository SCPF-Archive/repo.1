#!/bin/bash

echo "MAKING DIRECTORIES"
mkdir -p cli
mkdir -p integrations
mkdir -p patches

echo "SET WGET HEADER"
WGET_HEADER="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"

echo "DOWNLOADING CLI"
CLI_REPO="revanced/revanced-cli"
CLI_ASSETS=".jar"
wget --progress=dot:mega --header="$WGET_HEADER" $(curl -s "https://api.github.com/repos/"$CLI_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${CLI_ASSETS}"'")) | .browser_download_url')
mv *.jar cli

echo "DOWNLOADING INTEGRATIONS"
INTEGRATIONS_REPO="revanced/revanced-integrations"
INTEGRATIONS_ASSETS=".apk"
wget --progress=dot:mega --header="$WGET_HEADER" $(curl -s "https://api.github.com/repos/"$INTEGRATIONS_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${INTEGRATIONS_ASSETS}"'")) | .browser_download_url')
mv *.apk integrations

echo "DOWNLOADING PATCHES"
PATCHES_REPO="revanced/revanced-patches"
PATCHES_ASSETS=".jar"
wget --progress=dot:mega --header="$WGET_HEADER" $(curl -s "https://api.github.com/repos/"$PATCHES_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${PATCHES_ASSETS}"'")) | .browser_download_url')
mv *.jar patches
