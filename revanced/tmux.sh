#!/bin/bash

NXF="true"

countdown ()
{
for i in {5..1}; do
  echo "$i"
  sleep 1
done
echo "NXF Installation Done"
}

choice_nxf ()
{
if [[ $NXF == "true" ]] ; then
  countdown
elif [[ $NXF == "false" ]] ; then
  echo "NXF Disabled"
else
  echo "Unknown command."
fi
}

choice_nxf && sleep 3 && clear

echo "UNDER DEVELOPMENT"
