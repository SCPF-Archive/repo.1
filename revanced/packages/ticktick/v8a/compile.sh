#!/bin/bash

patches_file=./universal.patch

included_start="$(grep -n -m1 'INCLUDED PATCHES' "$patches_file" | cut -d':' -f1)"
excluded_start="$(grep -n -m1 'EXCLUDED PATCHES' "$patches_file" | cut -d':' -f1)"

included_patches="$(tail -n +"$included_start" "$patches_file" | head -n "$(( excluded_start - included_start ))" | grep '^[^#[:blank:]]')"
excluded_patches="$(tail -n +"$excluded_start" "$patches_file" | grep '^[^#[:blank:]]')"

populate_patches()
{
    while read -r revanced_patches
    do
        patches+=("$1 $revanced_patches")
    done <<< "$2"
}

echo "CLEANING UP"
if [[ "$1" == "clean" ]]; then
    rm -f revanced-cli.jar revanced-integrations.apk revanced-patches.jar
    exit
fi

if [[ "$1" == "experimental" ]]; then
    EXPERIMENTAL="--experimental"
fi

echo "CALL POPULATE PATCHES"
[[ -n "$included_patches" ]] && populate_patches "-i" "$included_patches"
[[ -n "$excluded_patches" ]] && populate_patches "-e" "$excluded_patches"

echo "MAKING DIRECTORY"
mkdir -p output

echo "COMPILING TICKTICK arm64-v8a"
if [ -f "com.ticktick.task.apk" ]
then
    echo "PATCHING TICKTICK arm64-v8a"
    java -jar cli.jar -m integrations.apk -b patches.jar \
        ${patches[@]} \
        $EXPERIMENTAL \
        -a com.ticktick.task.apk -o output/ticktick.64-v8a.apk
else
    echo "NO BASE PACKAGE, SKIP COMPILING TICKTICK arm64-v8a"
fi

echo "DONE"
