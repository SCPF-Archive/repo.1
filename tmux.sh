#!/bin/bash

APPS="$1"
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
cp revanced/assets/versions/latest/versions.json revanced/packages/$1/versions
cp revanced/assets/temp/cli/*.jar revanced/packages/$1
cp revanced/assets/temp/integrations/*.apk revanced/packages/$1
cp revanced/assets/temp/patches/*.jar revanced/packages/$1
cd revanced/packages/$1
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk *.patch versions
cd $HOMEDIR
}

##########

build_packages ()
{
select ITEM in bower npm gem pip
do
  echo -n "Enter the package name: " && read PACKAGE
  case $ITEM in
    bower) bower install $PACKAGE ;;
    npm)   npm   install $PACKAGE ;;
    gem)   gem   install $PACKAGE ;;
    pip)   pip   install $PACKAGE ;;
  esac
  break
done
}

##########

build_packages && sleep 3 && clear

echo "UNDER DEVELOPMENT
CHOICES:
install_rv = Download Revanced Prerequisites
backdrops = Backdrops
citra.emulator = Citra Emulator

EXAMPLE : ./tmux.sh backdrops
"
