#!/bin/bash

clear
HOMEDIR="$PWD"

##########

prerequisites ()
{
cd revanced/assets/temp && chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd $HOMEDIR
cd revanced && chmod +x copy.latest.files.sh && ./copy.latest.files.sh && cd $HOMEDIR
echo "ReVanced Prerequisites Updated/Installed"
echo "Going back to menu..."
sleep 3
}

##########

copy_latest_files ()
{
cd revanced/assets/temp && rm -rf cli integrations patches && cd $HOMEDIR
}

##########

select_apk ()
{
mkdir revanced/packages/$APKS/versions
cp revanced/assets/versions/latest/versions.json revanced/packages/$APKS/versions
cp revanced/assets/temp/cli/*.jar revanced/packages/$ZXYX
cp revanced/assets/temp/integrations/*.apk revanced/packages/$APKS
cp revanced/assets/temp/patches/*.jar revanced/packages/$APKS
cd revanced/packages/$APKS
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk *.patch versions
cd $HOMEDIR
}

##########

welc_msg ()
{
echo "UNDER DEVELOPMENT
CHOICES:
install_rv = Download Revanced Prerequisites
Backdrops = Install Backdrops
Citra Emulator = Install Citra Emulator
Exit = Exit Script
"
}

##########

welc_msg

select ZXYX in "Install ReVanced" "Backdrops" "Citra Emulator" "Exit Script"
do
  case $ZXYX in
    "Install ReVanced") prerequisites ;;
    "Backdrops") APKS="backdrops" && select_apk && unset APKS && ./$0 ;;
    "Citra Emulator") APKS="citra.emulator" && select_apk && unset APKS && ./$0 ;;
    "Exit Script") break ;;
    *) echo "Command not valid." ;;
  esac
done
