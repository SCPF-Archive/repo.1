#!/bin/bash

clear
HOMEDIR="$PWD"

##########

prerequisites ()
{
cd revanced/assets/temp && chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd $HOMEDIR
cd revanced && chmod +x copy.latest.files.sh && ./copy.latest.files.sh && cd $HOMEDIR
}

##########

copy_latest_files ()
{
cd revanced/assets/temp && rm -rf cli integrations patches && cd $HOMEDIR
}

##########

select_apk ()
{
cp revanced/assets/versions/latest/versions.json revanced/packages/$ZXYX/versions
cp revanced/assets/temp/cli/*.jar revanced/packages/$ZXYX
cp revanced/assets/temp/integrations/*.apk revanced/packages/$ZXYX
cp revanced/assets/temp/patches/*.jar revanced/packages/$ZXYX
cd revanced/packages/$ZXYX
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk *.patch versions
cd $HOMEDIR
}

##########

echo "UNDER DEVELOPMENT
CHOICES:
install_rv = Download Revanced Prerequisites
backdrops = Backdrops
citra.emulator = Citra Emulator
"

##########

select ZXYX in "Install ReVanced" "Backdrops" "Citra Emulator" "Exit Script"
do
  case $ZXYX in
    "Install ReVanced") prerequisites ;;
    "Backdrops") select_apk ;;
    "Citra Emulator") select_apk ;;
    "Exit Script") break ;;
    *) echo "Command not valid, exiting..." && break ;;
  esac
done
