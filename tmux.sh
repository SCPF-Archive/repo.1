#!/bin/bash

APPS="$1"
HOMEDIR="$PWD"

##########

rv_packages ()
{
cd revanced/assets/temp
echo "$(ls cli/*.jar)"
}

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

backdrops ()
{
cd revanced/packages/backdrops
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk *.patch versions
cd $HOMEDIR
}

##########

check_rv ()
{
if [[ rv_packages == "*.jar" ]]
  echo "ReVanced packages confirmed, proceeding..."
else
  prerequisites
fi
}

##########

build ()
{
if [[ $APPS == "1" ]] ; then
  copy_latest_files
  backdrops
elif [[ $APPS == "2" ]] ; then
  echo "NXF Disabled"
else
  echo "Unknown command."
fi
}

##########

check_rv && build && sleep 3 && clear

echo "UNDER DEVELOPMENT
CHOICES:
1. Backdrops
2. Citra Emulator

NOTE : CHOOSE NUMBER ONLY
EXAMPLE : ./tmux.sh 1
"
