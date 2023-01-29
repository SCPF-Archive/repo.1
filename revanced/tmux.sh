#!/bin/bash

clear
HOMEDIR="$PWD" ## /data/data/com.termux/files/home/dev/revanced

##########

# This downloads the ReVanced CLI, Integrations, and Patches.

prerequisites () {
  clear
  cd "$HOMEDIR/assets/temp"
  if [ -z "$(ls cli/*.jar)" ]; then
    pkg upgrade openjdk-17 wget jq aapt zipalign && chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd "$HOMEDIR"
    echo "ReVanced Prerequisites Updated/Installed"
  else
    echo "ReVanced Prerequisites Already Updated/Installed"
  fi
  cd "$HOMEDIR"
}

##########

# This patches the packages.

select_apk () {
  clear
  cd "$HOMEDIR/packages/$APKS"
  if [ -f output/*.apk ]; then
    echo "Already patched, skipping download..."
  else
    mkdir versions
    cp "$HOMEDIR/assets/versions/latest/versions.json" versions
    cp "$HOMEDIR/assets/patches/*.patch" .
    cp "$HOMEDIR/assets/temp/cli/*.jar" cli.jar
    cp "$HOMEDIR/assets/temp/integrations/*.apk" integrations.apk
    cp "$HOMEDIR/assets/temp/patches/*.jar" patches.jar
    chmod +x download.sh && ./download.sh
    chmod +x compile.sh && ./compile.sh experimental
    rm -rf *.jar *.apk *.patch versions
  fi
  cd "$HOMEDIR"
}

##########

# This signs the the packages.

sign_and_move_packages() {
  echo "Downloading signer..."
  wget -nv https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar
  mv uber-apk-signer-1.2.1.jar signer.jar
  mkdir $HOMEDIR/packages/$APKS/output/release
  mkdir $HOMEDIR/release
  echo "Signing packages..."
  java -jar signer.jar --allowResign -a $HOMEDIR/packages/$APKS/output -o $HOMEDIR/packages/$APKS/output/release
  mv -v $HOMEDIR/packages/$APKS/output/release/*.apk $HOMEDIR/release/$APKS.apk
  echo "Moving the packages..."
  cd /
  mkdir /storage/emulated/0/ReVanced
  rm -f /storage/emulated/0/ReVanced/$APKS.apk
  mv $HOMEDIR/release/*.apk /storage/emulated/0/ReVanced
  cd $HOMEDIR
}

##########

# This is the function in menu.

uncased() {
  APKS="$MKMF"
  select_apk
  sign_and_move_packages
  mkdir /storage/emulated/0/ReVanced
  cd $HOMEDIR/packages/$MKMF
  chmod +x download.sh && ./download.sh
  rm -f /storage/emulated/0/ReVanced/$APKS.apk
  mv $HOMEDIR/release/*.apk /storage/emulated/0/ReVanced 
  unset APKS
  echo "Going back to main menu in..."
  for i in {3..1} ; do
    echo "$i"
    sleep 1
  done
}

uncased_2() {
  APKS="$MKMF"
  mkdir $HOMEDIR/release
  mkdir /storage/emulated/0/ReVanced
  cd $HOMEDIR/packages/$MKMF
  chmod +x download.sh && ./download.sh
  mv $HOMEDIR/packages/$APKS/*.apk $HOMEDIR/release/$APKS.apk
  rm -f /storage/emulated/0/ReVanced/$APKS.apk
  mv $HOMEDIR/release/*.apk /storage/emulated/0/ReVanced 
  unset APKS
  echo "Going back to main menu in..."
  for i in {3..1} ; do
    echo "$i"
    sleep 1
  done
}

##########

# This updates the repo.

update_script() {
  git reset --hard && git pull && chmod +x tmux.sh
  echo "Restarting Script"
  for zdf in {3..1} ; do
    echo "$zdf"
    sleep 1
  done
  ./tmux.sh
}

##########

# This shows the script info.

script_info ()
{
echo "
THE SCRIPT IS UNDER DEVELOPMENT.

In this script, you can patch the supported
Revanced applications without even using
the official ReVanced Manager. If you already
have Termux, why do bother installing the
ReVanced Manager when you can patch it in here?
All the patched packages are moved in the ReVanced
folder, you can find it in the internal storage.
"
read -n 1 -s -r -p "Press any key to continue..."
clear
}

##########

# This is a welcome message.

wlcmsg ()
{
clear
cat assets/banner/scpf.logo.txt
sleep 1
script_info
}

##########

menu_select() {
  clear
  echo "Please select a number..."
  echo ""
  select option in "Install Prerequisites" "Patch Packages" "Update Script" "Script Info" "Exit Script"
  do
    case $option in
      "Install Prerequisites") prerequisites && rerun_script && break 2 ;;
      "Patch Packages") patch_packages && break 2 ;;
      "Update Script") update_script && break 2 ;;
      "Script Info") script_info ;;
      "Exit Script") clear && break 2 && exit ;;
      *) echo "Command not valid." ;;
    esac
  done
}

patch_packages() {
  clear
  echo "Please select a number..."
  echo ""
  select package in "backdrops" "citra.emulator" "icon.pack.studio" "microg" "nova.launcher" "nyx.music.player/64.v8a" "nyx.music.player/v7a" "nyx.music.player/x86.64" "nyx.music.player/x86" "reddit" "revanced.manager" "spotify" "ticktick/64.v8a" "ticktick/v7a" "ticktick/x86.64" "ticktick/x86" "tiktok" "twitch" "twitter" "youtube.music/64.v8a" "youtube.music/v7a" "youtube.music/x86.64" "youtube.music/x86" "youtube" "Return Back"
  do
    case $package in
      "backdrops") uncased && menu_select && break 2 ;;
      "citra.emulator") uncased && menu_select && break 2 ;;
      "icon.pack.studio") uncased && menu_select && break 2 ;;
      "microg") uncased_2 && menu_select && break 2 ;;
      "nova.launcher") uncased && menu_select && break 2 ;;
      "nyx.music.player/64.v8a") uncased && menu_select && break 2 ;;
      "nyx.music.player/v7a") uncased && menu_select && break 2 ;;
      "nyx.music.player/x86.64") uncased && menu_select && break 2 ;;
      "nyx.music.player/x86") uncased && menu_select && break 2 ;;
      "reddit") uncased && menu_select && break 2 ;;
      "revanced.manager") uncased_2 && menu_select && break 2 ;;
      "spotify") uncased && menu_select && break 2 ;;
      "ticktick/64.v8a") uncased && menu_select && break 2 ;;
      "ticktick/v7a") uncased && menu_select && break 2 ;;
      "ticktick/x86.64") uncased && menu_select && break 2 ;;
      "ticktick/x86") uncased && menu_select && break 2 ;;
      "tiktok") uncased && menu_select && break 2 ;;
      "twitch") uncased && menu_select && break 2 ;;
      "twitter") uncased && menu_select && break 2 ;;
      "youtube.music/64.v8a") uncased && menu_select && break 2 ;;
      "youtube.music/v7a") uncased && menu_select && break 2 ;;
      "youtube.music/x86.64") uncased && menu_select && break 2 ;;
      "youtube.music/x86") uncased && menu_select && break 2 ;;
      "youtube") uncased && menu_select && break 2 ;;
      "Return Back") clear && menu_select && break 2 ;;
      *) echo "Command not valid." ;;
    esac
  done
}

##########

# This is the main function.

wlcmsg && menu_select
