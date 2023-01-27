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

select ZXYX in install_rv backdrops citra.emulator
do
  echo "UNDER DEVELOPMENT
  CHOICES:
  install_rv = Download Revanced Prerequisites
  backdrops = Backdrops
  citra.emulator = Citra Emulator"

  case $ZXYX in
    install_rv) prerequisites ;;
    *) select_apk ;;
  esac
  break
done




