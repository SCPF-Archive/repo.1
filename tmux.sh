#!/bin/bash

clear
HOMEDIR="$PWD"

##########

update_script ()
{
clear
git reset --hard
git pull
chmod +x tmux.sh
}

##########

prerequisites ()
{
clear
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
clear
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

wlcmsg ()
{
clear
echo "UNDER DEVELOPMENT
CHOICES:
install_rv = Download Revanced Prerequisites
Backdrops = Install Backdrops
Citra Emulator = Install Citra Emulator
Exit = Exit Script
"
}

##########

wlcmsg

select ZXYX in "Install Prerequisites" "Backdrops" "Citra Emulator" "Update Script" "Exit Script"
do
  case $ZXYX in
    "Install Prerequisites") prerequisites ;;
    "Backdrops") APKS="backdrops" && select_apk && unset APKS && break ;;
    "Citra Emulator") APKS="citra.emulator" && select_apk && unset APKS && break ;;
    "Update Script") update_script && break ;;
    "Exit Script") break ;;
    *) echo "Command not valid." ;;
  esac
done
