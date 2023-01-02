#!/bin/bash

echo "MAKING DIRECTORIES"
mkdir -p cli
mkdir -p integrations
mkdir -p patches

echo "DOWNLOADING CLI"
CLI_REPO="revanced/revanced-cli"
CLI_ASSETS=".jar"
wget --progress=dot:mega $(curl -s "https://api.github.com/repos/"$CLI_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${CLI_ASSETS}"'")) | .browser_download_url')
mv *.jar cli

echo "DOWNLOADING INTEGRATIONS"
INTEGRATIONS_REPO="revanced/revanced-integrations"
INTEGRATIONS_ASSETS=".jar"
wget --progress=dot:mega $(curl -s "https://api.github.com/repos/"$INTEGRATIONS_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${INTEGRATIONS_ASSETS}"'")) | .browser_download_url')
mv *.jar integrations

echo "DOWNLOADING PATCHES"
PATCHES_REPO="revanced/revanced-patches"
PATCHES_ASSETS=".jar"
wget --progress=dot:mega $(curl -s "https://api.github.com/repos/"$PATCHES_REPO"/releases/latest" | jq -r '.assets[] | select(.name | contains("'"${PATCHES_ASSETS}"'")) | .browser_download_url')
mv *.jar patches
