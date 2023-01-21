#!/bin/bash

echo "DOWNLOADING APK SIGNER"
wget -nv https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar
mv uber-apk-signer-1.2.1.jar signer.jar

echo "PREPARING"
mkdir -p packages/backdrops/output/release
mkdir -p packages/citra.emulator/output/release
mkdir -p packages/icon.pack.studio/output/release
mkdir -p packages/nova.launcher/output/release
mkdir -p packages/nyx/output/release
mkdir -p packages/reddit/output/release
mkdir -p packages/spotify/output/release
mkdir -p packages/ticktick/64.v8a/output/release
mkdir -p packages/ticktick/v7a/output/release
mkdir -p packages/ticktick/x86.64/output/release
mkdir -p packages/ticktick/x86/output/release
mkdir -p packages/tiktok/output/release
mkdir -p packages/twitch/output/release
mkdir -p packages/twitter/output/release
mkdir -p packages/youtube/output/release
mkdir -p packages/youtube.music/v7a/output/release
mkdir -p packages/youtube.music/v8a/output/release
mkdir -p packages/latest/app

echo "SIGNING PACKAGES"
if [ -f "sign.sh" ]
then
    mv -v packages/micro-g/microg-google-icon.apk packages/latest/app/micro-g.google-icon.apk

    mv -v packages/micro-g/microg.apk packages/latest/app/micro-g.apk

    mv -v packages/revanced.manager/*.apk packages/latest/app/revanced.manager.apk

    java -jar signer.jar --allowResign -a packages/backdrops/output -o packages/backdrops/output/release
    mv -v packages/backdrops/output/release/backdrops-aligned-debugSigned.apk packages/latest/app/backdrops.apk

    java -jar signer.jar --allowResign -a packages/citra.emulator/output -o packages/citra.emulator/output/release
    mv -v packages/citra.emulator/output/release/citra.emulator-aligned-debugSigned.apk packages/latest/app/citra.emulator.apk

    java -jar signer.jar --allowResign -a packages/icon.pack.studio/output -o packages/icon.pack.studio/output/release
    mv -v packages/icon.pack.studio/output/release/icon.pack.studio-aligned-debugSigned.apk packages/latest/app/icon.pack.studio.apk

    java -jar signer.jar --allowResign -a packages/nova.launcher/output -o packages/nova.launcher/output/release
    mv -v packages/nova.launcher/output/release/nova.launcher-aligned-debugSigned.apk packages/latest/app/nova.launcher.apk

    java -jar signer.jar --allowResign -a packages/nyx/output -o packages/nyx/output/release
    mv -v packages/nyx/output/release/nyx-aligned-debugSigned.apk packages/latest/app/nyx.apk

    java -jar signer.jar --allowResign -a packages/reddit/output -o packages/reddit/output/release
    mv -v packages/reddit/output/release/reddit-aligned-debugSigned.apk packages/latest/app/reddit.apk

    java -jar signer.jar --allowResign -a packages/spotify/output -o packages/spotify/output/release
    mv -v packages/spotify/output/release/spotify-aligned-debugSigned.apk packages/latest/app/spotify.apk

    java -jar signer.jar --allowResign -a packages/ticktick/64.v8a/output -o packages/ticktick/64.v8a/output/release
    mv -v packages/ticktick/64.v8a/output/release/*.apk packages/latest/app/ticktick.64-v8a.apk
    ls packages/ticktick/64.v8a/output/release/*
    java -jar signer.jar --allowResign -a packages/ticktick/v7a/output -o packages/ticktick/v7a/output/release
    mv -v packages/ticktick/v7a/output/release/ticktick.v7a-aligned-debugSigned.apk packages/latest/app/ticktick.v7a.apk
    java -jar signer.jar --allowResign -a packages/ticktick/x86.64/output -o packages/ticktick/x86.64/output/release
    mv -v packages/ticktick/x86.64/output/release/ticktick.x86.64-aligned-debugSigned.apk packages/latest/app/ticktick.x86.64.apk
    java -jar signer.jar --allowResign -a packages/ticktick/x86/output -o packages/ticktick/x86/output/release
    mv -v packages/ticktick/x86/output/release/ticktick.x86-aligned-debugSigned.apk packages/latest/app/ticktick.x86.apk

    java -jar signer.jar --allowResign -a packages/tiktok/output -o packages/tiktok/output/release
    mv -v packages/tiktok/output/release/tiktok-aligned-debugSigned.apk packages/latest/app/tiktok.apk

    java -jar signer.jar --allowResign -a packages/twitch/output -o packages/twitch/output/release
    mv -v packages/twitch/output/release/twitch-aligned-debugSigned.apk packages/latest/app/twitch.apk

    java -jar signer.jar --allowResign -a packages/twitter/output -o packages/twitter/output/release
    mv -v packages/twitter/output/release/twitter-aligned-debugSigned.apk packages/latest/app/twitter.apk

    java -jar signer.jar --allowResign -a packages/youtube/output -o packages/youtube/output/release
    mv -v packages/youtube/output/release/youtube-aligned-debugSigned.apk packages/latest/app/youtube.apk

    java -jar signer.jar --allowResign -a packages/youtube.music/v7a/output -o packages/youtube.music/v7a/output/release
    mv -v packages/youtube.music/v7a/output/release/yt.music.v7a-aligned-debugSigned.apk packages/latest/app/yt.music.v7a.apk

    java -jar signer.jar --allowResign -a packages/youtube.music/v8a/output -o packages/youtube.music/v8a/output/release
    mv -v packages/youtube.music/v8a/output/release/yt.music.64-v8a-aligned-debugSigned.apk packages/latest/app/yt.music.64-v8a.apk
fi

echo "DONE SIGNING"

