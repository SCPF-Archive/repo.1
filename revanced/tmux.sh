#!/bin/bash

APPS="$1"

countdown ()
{
for i in {5..1}; do
  echo "$i"
  sleep 1
done
echo "Installation Done"
}

build ()
{
if [[ $APPS == "1" ]] ; then
  countdown
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
