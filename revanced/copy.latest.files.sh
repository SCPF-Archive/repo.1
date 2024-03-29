#!/bin/bash

echo "MAKING DIRECTORIES"
mkdir -p packages/backdrops/versions
mkdir -p packages/citra.emulator/versions
mkdir -p packages/hexedit/versions
mkdir -p packages/icon.pack.studio/versions
mkdir -p packages/nova.launcher/versions
mkdir -p packages/nyx.music.player/64.v8a/versions
mkdir -p packages/nyx.music.player/v7a/versions
mkdir -p packages/nyx.music.player/x86.64/versions
mkdir -p packages/nyx.music.player/x86/versions
mkdir -p packages/reddit/versions
mkdir -p packages/ticktick/64.v8a/versions
mkdir -p packages/ticktick/v7a/versions
mkdir -p packages/ticktick/x86.64/versions
mkdir -p packages/ticktick/x86/versions
mkdir -p packages/tiktok/versions
mkdir -p packages/twitch/versions
mkdir -p packages/twitter/versions
mkdir -p packages/youtube.music/64.v8a/versions
mkdir -p packages/youtube.music/v7a/versions
mkdir -p packages/youtube.music/x86.64/versions
mkdir -p packages/youtube.music/x86/versions
mkdir -p packages/youtube/versions

echo "COPYING LATEST VERSION FILES"
cp -p assets/versions/latest/versions.json packages/backdrops/versions
cp -p assets/versions/latest/versions.json packages/citra.emulator/versions
cp -p assets/versions/latest/versions.json packages/hexedit/versions
cp -p assets/versions/latest/versions.json packages/icon.pack.studio/versions
cp -p assets/versions/latest/versions.json packages/nova.launcher/versions
cp -p assets/versions/latest/versions.json packages/nyx.music.player/64.v8a/versions
cp -p assets/versions/latest/versions.json packages/nyx.music.player/v7a/versions
cp -p assets/versions/latest/versions.json packages/nyx.music.player/x86.64/versions
cp -p assets/versions/latest/versions.json packages/nyx.music.player/x86/versions
cp -p assets/versions/latest/versions.json packages/reddit/versions
cp -p assets/versions/latest/versions.json packages/ticktick/64.v8a/versions
cp -p assets/versions/latest/versions.json packages/ticktick/v7a/versions
cp -p assets/versions/latest/versions.json packages/ticktick/x86.64/versions
cp -p assets/versions/latest/versions.json packages/ticktick/x86/versions
cp -p assets/versions/latest/versions.json packages/tiktok/versions
cp -p assets/versions/latest/versions.json packages/twitch/versions
cp -p assets/versions/latest/versions.json packages/twitter/versions
cp -p assets/versions/latest/versions.json packages/youtube.music/64.v8a/versions
cp -p assets/versions/latest/versions.json packages/youtube.music/v7a/versions
cp -p assets/versions/latest/versions.json packages/youtube.music/x86.64/versions
cp -p assets/versions/latest/versions.json packages/youtube.music/x86/versions
cp -p assets/versions/latest/versions.json packages/youtube/versions

echo "COPYING PATCH FILES"
cp -p assets/patches/universal.patch packages/backdrops
cp -p assets/patches/universal.patch packages/citra.emulator
cp -p assets/patches/universal.patch packages/hexedit
cp -p assets/patches/universal.patch packages/icon.pack.studio
cp -p assets/patches/universal.patch packages/nova.launcher
cp -p assets/patches/universal.patch packages/nyx.music.player/64.v8a
cp -p assets/patches/universal.patch packages/nyx.music.player/v7a
cp -p assets/patches/universal.patch packages/nyx.music.player/x86.64
cp -p assets/patches/universal.patch packages/nyx.music.player/x86
cp -p assets/patches/reddit.patch packages/reddit
cp -p assets/patches/spotify.patch packages/spotify
cp -p assets/patches/universal.patch packages/ticktick/64.v8a
cp -p assets/patches/universal.patch packages/ticktick/v7a
cp -p assets/patches/universal.patch packages/ticktick/x86.64
cp -p assets/patches/universal.patch packages/ticktick/x86
cp -p assets/patches/tiktok.patch packages/tiktok
cp -p assets/patches/twitch.patch packages/twitch
cp -p assets/patches/twitter.patch packages/twitter
cp -p assets/patches/youtube.music.patch packages/youtube.music/64.v8a
cp -p assets/patches/youtube.music.patch packages/youtube.music/v7a
cp -p assets/patches/youtube.music.patch packages/youtube.music/x86.64
cp -p assets/patches/youtube.music.patch packages/youtube.music/x86
cp -p assets/patches/youtube.patch packages/youtube

echo "COPYING REVANCED CLI"
cp -p assets/temp/cli/*.jar packages/backdrops/cli.jar
cp -p assets/temp/cli/*.jar packages/citra.emulator/cli.jar
cp -p assets/temp/cli/*.jar packages/hexedit/cli.jar
cp -p assets/temp/cli/*.jar packages/icon.pack.studio/cli.jar
cp -p assets/temp/cli/*.jar packages/nova.launcher/cli.jar
cp -p assets/temp/cli/*.jar packages/nyx.music.player/64.v8a/cli.jar
cp -p assets/temp/cli/*.jar packages/nyx.music.player/v7a/cli.jar
cp -p assets/temp/cli/*.jar packages/nyx.music.player/x86.64/cli.jar
cp -p assets/temp/cli/*.jar packages/nyx.music.player/x86/cli.jar
cp -p assets/temp/cli/*.jar packages/reddit/cli.jar
cp -p assets/temp/cli/*.jar packages/spotify/cli.jar
cp -p assets/temp/cli/*.jar packages/ticktick/64.v8a/cli.jar
cp -p assets/temp/cli/*.jar packages/ticktick/v7a/cli.jar
cp -p assets/temp/cli/*.jar packages/ticktick/x86.64/cli.jar
cp -p assets/temp/cli/*.jar packages/ticktick/x86/cli.jar
cp -p assets/temp/cli/*.jar packages/tiktok/cli.jar
cp -p assets/temp/cli/*.jar packages/twitch/cli.jar
cp -p assets/temp/cli/*.jar packages/twitter/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube.music/64.v8a/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube.music/v7a/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube.music/x86.64/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube.music/x86/cli.jar
cp -p assets/temp/cli/*.jar packages/youtube/cli.jar

echo "COPYING REVANCED INTEGRATIONS"
cp -p assets/temp/integrations/*.apk packages/backdrops/integrations.apk
cp -p assets/temp/integrations/*.apk packages/citra.emulator/integrations.apk
cp -p assets/temp/integrations/*.apk packages/hexedit/integrations.apk
cp -p assets/temp/integrations/*.apk packages/icon.pack.studio/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nova.launcher/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nyx.music.player/64.v8a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nyx.music.player/v7a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nyx.music.player/x86.64/integrations.apk
cp -p assets/temp/integrations/*.apk packages/nyx.music.player/x86/integrations.apk
cp -p assets/temp/integrations/*.apk packages/reddit/integrations.apk
cp -p assets/temp/integrations/*.apk packages/spotify/integrations.apk
cp -p assets/temp/integrations/*.apk packages/ticktick/64.v8a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/ticktick/v7a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/ticktick/x86.64/integrations.apk
cp -p assets/temp/integrations/*.apk packages/ticktick/x86/integrations.apk
cp -p assets/temp/integrations/*.apk packages/tiktok/integrations.apk
cp -p assets/temp/integrations/*.apk packages/twitch/integrations.apk
cp -p assets/temp/integrations/*.apk packages/twitter/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube.music/64.v8a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube.music/v7a/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube.music/x86.64/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube.music/x86/integrations.apk
cp -p assets/temp/integrations/*.apk packages/youtube/integrations.apk

echo "COPYING REVANCED PATCHES"
cp -p assets/temp/patches/*.jar packages/backdrops/patches.jar
cp -p assets/temp/patches/*.jar packages/citra.emulator/patches.jar
cp -p assets/temp/patches/*.jar packages/hexedit/patches.jar
cp -p assets/temp/patches/*.jar packages/icon.pack.studio/patches.jar
cp -p assets/temp/patches/*.jar packages/nova.launcher/patches.jar
cp -p assets/temp/patches/*.jar packages/nyx.music.player/64.v8a/patches.jar
cp -p assets/temp/patches/*.jar packages/nyx.music.player/v7a/patches.jar
cp -p assets/temp/patches/*.jar packages/nyx.music.player/x86.64/patches.jar
cp -p assets/temp/patches/*.jar packages/nyx.music.player/x86/patches.jar
cp -p assets/temp/patches/*.jar packages/reddit/patches.jar
cp -p assets/temp/patches/*.jar packages/spotify/patches.jar
cp -p assets/temp/patches/*.jar packages/ticktick/64.v8a/patches.jar
cp -p assets/temp/patches/*.jar packages/ticktick/v7a/patches.jar
cp -p assets/temp/patches/*.jar packages/ticktick/x86.64/patches.jar
cp -p assets/temp/patches/*.jar packages/ticktick/x86/patches.jar
cp -p assets/temp/patches/*.jar packages/tiktok/patches.jar
cp -p assets/temp/patches/*.jar packages/twitch/patches.jar
cp -p assets/temp/patches/*.jar packages/twitter/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube.music/64.v8a/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube.music/v7a/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube.music/x86.64/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube.music/x86/patches.jar
cp -p assets/temp/patches/*.jar packages/youtube/patches.jar

echo "DONE COPYING FILES"
