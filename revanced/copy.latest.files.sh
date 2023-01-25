#!/bin/bash

echo "MAKING DIRECTORIES"
for package in backdrops citra.emulator icon.pack.studio nova.launcher nyx.music.player reddit ticktick tiktok twitch twitter youtube.music youtube; do
  mkdir -p packages/"$package"/versions
  mkdir -p packages/"$package"/v7a/versions
  mkdir -p packages/"$package"/64.v8a/versions
  mkdir -p packages/"$package"/x86.64/versions
  mkdir -p packages/"$package"/x86/versions
done

echo "COPYING LATEST VERSION FILES"
cp -p assets/versions/latest/versions.json packages/*/*/versions

echo "COPYING PATCH FILES"
cp -p assets/patches/universal.patch packages/backdrops
cp -p assets/patches/universal.patch packages/citra.emulator
cp -p assets/patches/universal.patch packages/icon.pack.studio
cp -p assets/patches/universal.patch packages/nova.launcher
cp -p assets/patches/universal.patch packages/nyx.music.player/*
cp -p assets/patches/reddit.patch packages/reddit
cp -p assets/patches/spotify.patch packages/spotify
cp -p assets/patches/universal.patch packages/ticktick/*
cp -p assets/patches/tiktok.patch packages/tiktok
cp -p assets/patches/twitch.patch packages/twitch
cp -p assets/patches/twitter.patch packages/twitter
cp -p assets/patches/youtube.music.patch packages/youtube.music/*
cp -p assets/patches/youtube.patch packages/youtube

echo "COPYING REVANCED CLI"
cp -p assets/temp/cli/*.jar packages/*/*/cli.jar

echo "COPYING REVANCED INTEGRATIONS"
cp -p assets/temp/integrations/*.apk packages/*/*/integrations.apk

echo "COPYING REVANCED PATCHES"
cp -p assets/temp/patches/*.jar packages/*/*/patches.jar

echo "DONE COPYING FILES"

echo "CLEANING CACHE"
rm -rf assets
