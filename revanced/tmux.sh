#!/bin/bash

clear
HOMEDIR=$(pwd) ## /data/data/com.termux/files/home/dev/revanced
LOCALDIR="/storage/emulated/0"

##########

# This downloads the ReVanced CLI, Integrations, and Patches.

prerequisites_install_info() {
echo "
This will install the prerequisites.
Just type y or Y in every prompt.
Type n or N on every prompt to
cancel installation.
"
echo ""
read -n 1 -s -r -p "Press any key to continue..."
}

prerequisites_install() {
  clear
  cd $HOMEDIR/assets/temp
  if [ -z "$(ls cli/*.jar)" ]; then
    clear
    prerequisites_install_info
    pkg upgrade openjdk-17
    pkg upgrade wget
    pkg upgrade jq
    pkg upgrade aapt
    pkg upgrade zipalign
    chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd "$HOMEDIR"
    echo "Prerequisites Updated/Installed"
    read -n 1 -s -r -p "Press any key to continue..."
  else
    echo "Prerequisites Already Updated/Installed"
    read -n 1 -s -r -p "Press any key to continue..."
  fi
  cd "$HOMEDIR"
}

prerequisites_force() {
  clear
  cd $HOMEDIR/assets/temp
  clear
  prerequisites_install_info
  echo ""
  echo "Confirm update..?"
  while true; do
    read -p "$* [y/n]: " yn
    case $yn in
      [Yy]*) return 0 ;;  
      [Nn]*) echo "Aborted" ; return 1 ;;
    esac
  done
  pkg upgrade openjdk-17
  pkg upgrade wget
  pkg upgrade jq
  pkg upgrade aapt
  pkg upgrade zipalign
  rm -rf cli integrations patches
  chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd "$HOMEDIR"
  echo "Prerequisites Updated/Installed"
  read -n 1 -s -r -p "Press any key to continue..."
  cd "$HOMEDIR"
}

##########

# This patches the packages.

copy_prerequisites_func() {
  cd $HOMEDIR/packages/$APKS
  cp $HOMEDIR/assets/versions/latest/versions.json versions
  cp $HOMEDIR/assets/patches/*.patch .
  cp $HOMEDIR/assets/temp/cli/*.jar cli.jar
  cp $HOMEDIR/assets/temp/integrations/*.apk integrations.apk
  cp $HOMEDIR/assets/temp/patches/*.jar patches.jar
}

move_and_clean_func() {
  cd $HOMEDIR/packages/$APKS
  echo "Moving the packages..."
  if [ -f $LOCALDIR/ReVanced]; then
    mkdir $LOCALDIR/ReVanced
  else
    echo "Directory exists, moving..."
  fi
  rm -f $LOCALDIR/ReVanced/$APKS.apk
  cp $HOMEDIR/packages/$APKS/output/*.apk $LOCALDIR/ReVanced
  rm -rf *.jar integrations.apk *.patch versions
}

select_apk () {
  clear
  cd $HOMEDIR/packages/$APKS
  if [ -f *.apk ]; then
    echo "Already downloaded, skipping download..."
    copy_prerequisites_func
    chmod +x compile.sh && ./compile.sh experimental
    move_and_clean_func
  else
    copy_prerequisites_func
    chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
    move_and_clean_func
  fi
  cd "$HOMEDIR"
}

##########

# This signs the the packages.

sign_and_move_packages() {
  if [ -f signer.jar ]; then
    echo "Signer already downloaded..."
  else
    echo "Downloading signer..."
    wget -nv https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar
    mv uber-apk-signer-1.2.1.jar signer.jar
  fi
  mkdir $HOMEDIR/packages/$APKS/output/release $HOMEDIR/release
  echo "Signing packages..."
  java -jar signer.jar --allowResign -a $HOMEDIR/packages/$APKS/output -o $HOMEDIR/packages/$APKS/output/release
  echo "Moving the packages..."
  mkdir $LOCALDIR/ReVanced
  rm -f $LOCALDIR/ReVanced/$APKS.apk
  mv $HOMEDIR/packages/$APKS/output/release/*.apk $LOCALDIR/ReVanced
  cd $HOMEDIR
}

##########

# This is the function in menu.

uncased() {
  APKS="$package"
  if [ -z $(ls $HOMEDIR/assets/temp/cli/*.jar) ]; then
    clear
    echo "Install prerequisites first..."
  else
    select_apk
  fi
  unset APKS
  echo "Going back to main menu in..."
  for i in {3..1} ; do
    echo "$i"
    sleep 1
  done
  read -n 1 -s -r -p "Press any key to continue..."
}

uncased_2() {
  APKS="$package"
  if [ -f $HOMEDIR/assets/temp/cli/*.jar ]; then
    echo "Install prerequisites first..."
  else
    cd $HOMEDIR/packages/$APKS
    chmod +x download.sh && ./download.sh
    rm -f $LOCALDIR/ReVanced/$APKS.apk
    mkdir $LOCALDIR/ReVanced
    mv $HOMEDIR/packages/$APKS/*.apk $LOCALDIR/ReVanced/$APKS.apk
  fi
  unset APKS
  echo "Going back to main menu in..."
  for i in {3..1} ; do
    echo "$i"
    sleep 1
  done
  read -n 1 -s -r -p "Press any key to continue..."
}

##########

# This clears the cache.

clear_cache_info() {
  echo "
  Clear Cache
  - Clears all the apk cache.

  Clear All Cache
  - Clears all the apk cache
    and ReVanced Prerequisites.
  "
  read -n 1 -s -r -p "Press any key to continue..."
}

clear_cache() {
  cd $HOMEDIR
  for $APKRM in $HOMEDIR/packages/*; do
    rm -rf $HOMEDIR/packages/$APKRM/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/64.v8a/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/v7a/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/x86.64/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/x86/*.apk
  done
  echo "Cache cleared, all clear..."
  echo ""
  read -n 1 -s -r -p "Press any key to continue..."
}

clear_all_cache() {
  cd $HOMEDIR
  rm -rf $HOMEDIR/assets/temp/cli
  rm -rf $HOMEDIR/assets/temp/integrations
  rm -rf $HOMEDIR/assets/temp/patches
  for $APKRM in $HOMEDIR/packages/*; do
    rm -rf $HOMEDIR/packages/$APKRM/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/64.v8a/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/v7a/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/x86.64/*.apk
    rm -rf $HOMEDIR/packages/$APKRM/x86/*.apk
  done
  echo "Cache cleared, all clear..."
  echo ""
  read -n 1 -s -r -p "Press any key to continue..."
}

##########

# This updates the repo.

update_script() {
  git reset --hard && git pull && chmod +x $HOMEDIR/*.sh
  echo "Restarting Script"
  for zdf in {3..1} ; do
    echo "$zdf"
    sleep 1
  done
  bash /data/data/com.termux/files/home/dev/revanced/tmux.sh
}

##########

# This is a welcome message.

wlcmsg() {
  clear
  cat $HOMEDIR/assets/banner/scpf.logo.txt
  sleep 1
  echo "
This script is a Bash script for the
ReVanced CLI, Integrations and Patches.
It updates the ReVanced Prerequisites
and downloads the CLI, Integrations
and Patches. It patches the packages,
signs them, and moves them to the storage.
  "
  echo "
It will provide a menu for selecting
packages to patch and sign, and it will
also allow the user to update the script,
view script info, and exit the script.
  "
  read -n 1 -s -r -p "Press any key to continue..."
}

##########

menu_select() {
  clear
  echo "Please select a number..."
  echo ""
  select option in "Install Prerequisites" "Patch Packages" "Update Script" "Script Info" "Clear Cache" "Exit Script"
  do
    case $option in
      "Install Prerequisites") prerequisites_menu && menu_select && break ;;
      "Patch Packages") patch_packages && break ;;
      "Update Script") update_script && break ;;
      "Script Info") wlcmsg && menu_select && break ;;
      "Clear Cache") clear_cache_options ;;
      "Exit Script") clear && exit && break ;;
      *) echo "Command not valid." ;;
    esac
  clear
  done
}

prerequisites_menu() {
  clear
  echo "Please select a number..."
  echo ""
  select option in "Install/Update" "Force Update" "Return Back"
  do
    case $option in
      "Install/Update") prerequisites_install && prerequisites_menu && break ;;
      "Force Update") prerequisites_force && prerequisites_menu && break ;;
      "Return Back") clear && menu_select && break ;;
      *) echo "Command not valid." ;;
    esac
  clear
  done
}

patch_packages() {
  clear
  echo "Please select a number..."
  echo ""
  select package in "backdrops" "citra.emulator" "hexedit" "icon.pack.studio" "microg" "nova.launcher" "nyx.music.player/64.v8a" "nyx.music.player/v7a" "nyx.music.player/x86.64" "nyx.music.player/x86" "reddit" "revanced.manager" "spotify" "ticktick/64.v8a" "ticktick/v7a" "ticktick/x86.64" "ticktick/x86" "tiktok" "twitch" "twitter" "youtube.music/64.v8a" "youtube.music/v7a" "youtube.music/x86.64" "youtube.music/x86" "youtube" "Return Back"
  do
    case $package in
      "backdrops") uncased && menu_select && break ;;
      "citra.emulator") uncased && menu_select && break ;;
      "hexedit") uncased && menu_select && break ;;
      "icon.pack.studio") uncased && menu_select && break ;;
      "microg") uncased_2 && menu_select && break ;;
      "nova.launcher") uncased && menu_select && break ;;
      "nyx.music.player/64.v8a") uncased && menu_select && break ;;
      "nyx.music.player/v7a") uncased && menu_select && break ;;
      "nyx.music.player/x86.64") uncased && menu_select && break ;;
      "nyx.music.player/x86") uncased && menu_select && break ;;
      "reddit") uncased && menu_select && break ;;
      "revanced.manager") uncased_2 && menu_select && break ;;
      "spotify") uncased && menu_select && break ;;
      "ticktick/64.v8a") uncased && menu_select && break ;;
      "ticktick/v7a") uncased && menu_select && break ;;
      "ticktick/x86.64") uncased && menu_select && break ;;
      "ticktick/x86") uncased && menu_select && break ;;
      "tiktok") uncased && menu_select && break ;;
      "twitch") uncased && menu_select && break ;;
      "twitter") uncased && menu_select && break ;;
      "youtube.music/64.v8a") uncased && menu_select && break ;;
      "youtube.music/v7a") uncased && menu_select && break ;;
      "youtube.music/x86.64") uncased && menu_select && break ;;
      "youtube.music/x86") uncased && menu_select && break ;;
      "youtube") uncased && menu_select && break ;;
      "Return Back") clear && menu_select && break ;;
      *) echo "Command not valid." ;;
    esac
  clear
  done
}

clear_cache_options() {
  clear
  echo "Please select a number..."
  echo ""
  select option in "Clear Cache" "Clear All Cache" "Info" "Return Back"
  do
    case $option in
      "Clear Cache") clear_cache && clear_cache_options && break ;;
      "Clear All Cache") clear_all_cache && clear_cache_options && break ;;
      "Info") clear_cache_info && clear_cache_options && break ;;
      "Return Back") clear && menu_select && break ;;
      *) echo "Command not valid." ;;
    esac
  clear
  done
}

##########

# This is the main function.

wlcmsg && menu_select
