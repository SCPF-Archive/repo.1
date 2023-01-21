#!/bin/bash

patches_file=./universal.patch

ARM_V7A="arm-v7a"
ARM64_V8A="arm64-v8a"
X86_64="x86_64"
X86="x86"

arch=$X86

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

echo "COMPILING TICKTICK $arch"
if [ -f "com.ticktick.task.apk" ]
then
    echo "PATCHING TICKTICK $arch"
    java -jar cli.jar -m integrations.apk -b patches.jar \
        ${patches[@]} \
        $EXPERIMENTAL \
        -a com.ticktick.task.apk -o output/ticktick.$arch.apk
else
    echo "NO BASE PACKAGE, SKIP COMPILING TICKTICK $arch"
fi

echo "DONE"
