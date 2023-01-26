#!/bin/bash

APPS="$1"
HOMEDIR="$PWD"

prerequisites ()
{
cd revanced/assets/temp && chmod +x download.prerequisites.sh && ./download.prerequisites.sh && cd $HOMEDIR
cd revanced && chmod +x copy.latest.files.sh && ./copy.latest.files.sh && cd $HOMEDIR
cd revanced/assets/temp && rm -rf cli integrations patches && cd $HOMEDIR
}

backdrops ()
{
cd revanced/packages/backdrops
rm -rf *.apk
chmod +x download.sh && ./download.sh && chmod +x compile.sh && ./compile.sh experimental
rm -rf *.jar *.apk
cd $HOMEDIR
}

build ()
{
if [[ $APPS == "1" ]] ; then
  prerequisites
  backdrops
elif [[ $APPS == "2" ]] ; then
  echo "NXF Disabled"
else
  echo "Unknown command."
fi
}

build && sleep 3 && clear

echo "UNDER DEVELOPMENT
CHOICES:
1. Backdrops
2. Citra Emulator

NOTE : CHOOSE NUMBER ONLY
EXAMPLE : ./tmux.sh 1
"
