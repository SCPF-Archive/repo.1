#!/bin/bash

echo "MAKING DIRECTORIES"
mkdir -p cli integrations patches

echo "DOWNLOADING CLI"
wget -nv --random-wait $(curl --silent "https://api.github.com/repos/revanced/revanced-cli/releases/latest" | jq -r '.assets[] | select(.name | contains("'.jar'")) | .browser_download_url') && mv *.jar cli

echo "DOWNLOADING INTEGRATIONS"
wget -nv --random-wait $(curl --silent "https://api.github.com/repos/revanced/revanced-integrations/releases/latest" | jq -r '.assets[] | select(.name | contains("'.apk'")) | .browser_download_url') && mv *.apk integrations

echo "DOWNLOADING PATCHES"
wget -nv --random-wait $(curl --silent "https://api.github.com/repos/revanced/revanced-patches/releases/latest" | jq -r '.assets[] | select(.name | contains("'.jar'")) | .browser_download_url') && mv *.jar patches
