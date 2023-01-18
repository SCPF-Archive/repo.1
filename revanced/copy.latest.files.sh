#!/bin/bash

echo "MAKING DIRECTORIES"
mkdir -p packages/backdrops/versions
mkdir -p packages/citra.emulator/versions
mkdir -p packages/icon.pack.studio/versions
mkdir -p packages/nova.launcher/versions
mkdir -p packages/nyx/versions
mkdir -p packages/reddit/versions
mkdir -p packages/ticktick/v7a/versions
mkdir -p packages/ticktick/v8a/versions
mkdir -p packages/tiktok/versions
mkdir -p packages/twitch/versions
mkdir -p packages/twitter/versions
mkdir -p packages/youtube/versions
mkdir -p packages/youtube.music/v7a/versions
mkdir -p packages/youtube.music/v8a/versions

echo "COPYING LATEST VERSION FILES"
cp -p assets/versions/latest/versions.json packages/backdrops/versions
cp -p assets/versions/latest/versions.json packages/citra.emulator/versions
cp -p assets/versions/latest/versions.json packages/icon.pack.studio/versions
cp -p assets/versions/latest/versions.json packages/nova.launcher/versions
cp -p assets/versions/latest/versions.json packages/reddit/versions
cp -p assets/versions/latest/versions.json packages/ticktick/v7a/versions
cp -p assets/versions/latest/versions.json packages/ticktick/v8a/versions
cp -p assets/versions/latest/versions.json packages/tiktok/versions
cp -p assets/versions/latest/versions.json packages/twitch/versions
cp -p assets/versions/latest/versions.json packages/twitter/versions
cp -p assets/versions/latest/versions.json packages/youtube/versions
cp -p assets/versions/latest/versions.json packages/youtube.music/v7a/versions
cp -p assets/versions/latest/versions.json packages/youtube.music/v8a/versions

echo "COPYING PATCH FILES"
cp -p assets/patches/universal.patch packages/backdrops
cp -p assets/patches/universal.patch packages/citra.emulator
cp -p assets/patches/universal.patch packages/icon.pack.studio
cp -p assets/patches/universal.patch packages/nova.launcher
cp -p assets/patches/universal.patch packages/nyx
cp -p assets/patches/reddit.patch packages/reddit
cp -p assets/patches/spotify.patch packages/spotify
cp -p assets/patches/universal.patch packages/ticktick/v7a
cp -p assets/patches/universal.patch packages/ticktick/v8a
cp -p assets/patches/tiktok.patch packages/tiktok
cp -p assets/patches/twitch.patch packages/twitch
cp -p assets/patches/twitter.patch packages/twitter
cp -p assets/patches/youtube.patch packages/youtube
cp -p assets/patches/youtube.music.patch packages/youtube.music/v7a
cp -p assets/patches/youtube.music.patch packages/youtube.music/v8a

echo "COPYING REVANCED CLI"
cp -p assets/temp/cli/*.jar packages/backdrops/cli.jar
cp -p assets/temp/cli/*.jar packages/citra.emulator/cli.jar
cp -p assets/temp/cli/*.jar packages/icon.pack.studio/cli.jar
cp -p assets/temp/cli/*.jar packages/nova.launcher/cli.jar
cp -p assets/temp/cli/*.jar packages/nyx/cli.jar
cp -p assets/temp/cli/*.jar packages/reddit/cli.jar
cp -p assets/temp/cli/*.jar packages/spotify/cli.jar
cp -p assets/temp/cli/*.jar packages/ticktick/v7a/cli.jar
cp -p assets/temp/cli/*.jar packages/ticktick/v8a/cli.jar
cp -p assets/temp/cli/*.jar packages/tiktok/cli.jar
cp -p assets/temp/cli/*.jar packages/twitch/cli.jar
cp -p assets/temp/cli/*.jar packages/twitter/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube.music/v7a/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube.music/v8a/cli.jar

echo "COPYING REVANCED INTEGRATIONS"
cp -p assets/temp/integrations/*.apk packages/backdrops/integrations.apk
cp -p assets/temp/integrations/*.apk packages/citra.emulator/integrations.apk
cp -p assets/temp/integrations/*.apk packages/icon.pack.studio/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nova.launcher/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nyx/integrations.apk
cp -p assets/temp/integrations/*.apk packages/reddit/integrations.apk
cp -p assets/temp/integrations/*.apk packages/spotify/integrations.apk
cp -p assets/temp/integrations/*.apk packages/ticktick/v7a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/ticktick/v8a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/tiktok/integrations.apk
cp -p assets/temp/integrations/*.apk packages/twitch/integrations.apk
cp -p assets/temp/integrations/*.apk packages/twitter/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube.music/v7a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube.music/v8a/integrations.apk

echo "COPYING REVANCED PATCHES"
cp -p assets/temp/patches/*.jar packages/backdrops/patches.jar
cp -p assets/temp/patches/*.jar packages/citra.emulator/patches.jar
cp -p assets/temp/patches/*.jar packages/icon.pack.studio/patches.jar
cp -p assets/temp/patches/*.jar packages/nova.launcher/patches.jar
cp -p assets/temp/patches/*.jar packages/nyx/patches.jar
cp -p assets/temp/patches/*.jar packages/reddit/patches.jar
cp -p assets/temp/patches/*.jar packages/spotify/patches.jar
cp -p assets/temp/patches/*.jar packages/ticktick/v7a/patches.jar
cp -p assets/temp/patches/*.jar packages/ticktick/v8a/patches.jar
cp -p assets/temp/patches/*.jar packages/tiktok/patches.jar
cp -p assets/temp/patches/*.jar packages/twitch/patches.jar
cp -p assets/temp/patches/*.jar packages/twitter/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube.music/v7a/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube.music/v8a/patches.jar

echo "DONE COPYING FILES"

echo "CLEANING TEMP FILES"
rm -rf assets
