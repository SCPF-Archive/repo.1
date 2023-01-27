#!/bin/bash

clear
HOMEDIR="$PWD" ## /data/data/com.termux/files/home/dev/revanced

##########

# This downloads the ReVanced CLI, Integrations, and Patches.

prerequisites ()
{
clear
cd assets/temp && chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd $HOMEDIR
chmod +x copy.latest.files.sh && ./copy.latest.files.sh && cd $HOMEDIR
echo "ReVanced Prerequisites Updated/Installed"
echo "Going back to the menu..."
sleep 3
}

##########

copy_latest_files ()
{
cd assets/temp && rm -rf cli integrations patches && cd $HOMEDIR
}

##########

# This patches the packages.

select_apk ()
{
clear
mkdir packages/$APKS/versions
cp assets/versions/latest/versions.json revanced/packages/$APKS/versions
cp assets/temp/cli/*.jar revanced/packages/$ZXYX
cp assets/temp/integrations/*.apk revanced/packages/$APKS
cp assets/temp/patches/*.jar revanced/packages/$APKS
cd packages/$APKS
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk *.patch versions
cd $HOMEDIR
}

##########

# This signs the the packages.

sign_packages ()
{
clear
chmod +x sign.sh
./sign.sh
rm -rf packages/$APKS/output
clear
ls release/*.apk
cd $HOMEDIR
}

##########

# This moves the packages to internal storage.

move_packages ()
{
echo "Moving the packages."
mkdir /storage/emulated/0/ReVanced
mv release/*.apk /storage/emulated/0/ReVanced
}

##########

# This updates the repo.

update_script ()
{
clear
git reset --hard
git pull
chmod +x tmux.sh
clear
}

##########

# This is a welcome message.

wlcmsg ()
{
clear
echo "UNDER DEVELOPMENT
CHOICES:
Install Prerequisites = Download ReVanced Prerequisites
Backdrops = Patch Backdrops
Citra Emulator = Patch Citra Emulator
Exit = Exit Script
"
}

##########

# This is the main function.

wlcmsg

select ZXYX in "Install Prerequisites" "Backdrops" "Citra Emulator" "Sign Packages" "Move Packages" "Update Script" "Exit Script"
do
  case $ZXYX in
    "Install Prerequisites") prerequisites ;;
    "Backdrops") APKS="backdrops" && select_apk && unset APKS && break ;;
    "Citra Emulator") APKS="citra.emulator" && select_apk && unset APKS && break ;;
    "Sign Packages") sign_packages && break ;;
    "Move Packages") move_packages && break ;;
    "Update Script") update_script && break ;;
    "Exit Script") break ;;
    *) echo "Command not valid." ;;
  esac
done
