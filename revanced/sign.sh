#!/bin/bash

echo "DOWNLOADING APK SIGNER"
wget -nv https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar
mv uber-apk-signer-1.2.1.jar signer.jar

echo "PREPARING"
mkdir -p packages/backdrops/output/release
mkdir -p packages/citra.emulator/output/release
mkdir -p packages/hexedit/output/release
mkdir -p packages/icon.pack.studio/output/release
mkdir -p packages/nova.launcher/output/release
mkdir -p packages/nyx.music.player/64.v8a/output/release
mkdir -p packages/nyx.music.player/v7a/output/release
mkdir -p packages/nyx.music.player/x86.64/output/release
mkdir -p packages/nyx.music.player/x86/output/release
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
mkdir -p release

echo "SIGNING PACKAGES"
if [ -f "sign.sh" ]
then
    java -jar signer.jar --allowResign -a packages/backdrops/output -o packages/backdrops/output/release
    mv -v packages/backdrops/output/release/*.apk release/backdrops.apk

    java -jar signer.jar --allowResign -a packages/citra.emulator/output -o packages/citra.emulator/output/release
    mv -v packages/citra.emulator/output/release/*.apk release/citra.emulator.apk

    java -jar signer.jar --allowResign -a packages/hexedit/output -o packages/hexedit/output/release
    mv -v packages/hexedit/output/release/*.apk release/hexedit.apk

    java -jar signer.jar --allowResign -a packages/icon.pack.studio/output -o packages/icon.pack.studio/output/release
    mv -v packages/icon.pack.studio/output/release/*.apk release/icon.pack.studio.apk

    mv -v packages/instagram/*.apk release/instagram.apk

    mv -v packages/microg/*.apk release/microg.apk

    java -jar signer.jar --allowResign -a packages/nova.launcher/output -o packages/nova.launcher/output/release
    mv -v packages/nova.launcher/output/release/*.apk release/nova.launcher.apk

    java -jar signer.jar --allowResign -a packages/nyx.music.player/64.v8a/output -o packages/nyx.music.player/64.v8a/output/release
    mv -v packages/nyx.music.player/64.v8a/output/release/*.apk release/nyx.music.player.64.v8a.apk

    java -jar signer.jar --allowResign -a packages/nyx.music.player/v7a/output -o packages/nyx.music.player/v7a/output/release
    mv -v packages/nyx.music.player/v7a/output/release/*.apk release/nyx.music.player.v7a.apk

    java -jar signer.jar --allowResign -a packages/nyx.music.player/x86.64/output -o packages/nyx.music.player/x86.64/output/release
    mv -v packages/nyx.music.player/x86.64/output/release/*.apk release/nyx.music.player.x86.64.apk

    java -jar signer.jar --allowResign -a packages/nyx.music.player/x86/output -o packages/nyx.music.player/x86/output/release
    mv -v packages/nyx.music.player/x86/output/release/*.apk release/nyx.music.player.x86.apk

    java -jar signer.jar --allowResign -a packages/reddit/output -o packages/reddit/output/release
    mv -v packages/reddit/output/release/*.apk release/reddit.apk

    mv -v packages/revanced.manager/*.apk release/revanced.manager.apk

    java -jar signer.jar --allowResign -a packages/spotify/output -o packages/spotify/output/release
    mv -v packages/spotify/output/release/*.apk release/spotify.apk

    java -jar signer.jar --allowResign -a packages/ticktick/64.v8a/output -o packages/ticktick/64.v8a/output/release
    mv -v packages/ticktick/64.v8a/output/release/*.apk release/ticktick.64.v8a.apk

    java -jar signer.jar --allowResign -a packages/ticktick/v7a/output -o packages/ticktick/v7a/output/release
    mv -v packages/ticktick/v7a/output/release/*.apk release/ticktick.v7a.apk

    java -jar signer.jar --allowResign -a packages/ticktick/x86.64/output -o packages/ticktick/x86.64/output/release
    mv -v packages/ticktick/x86.64/output/release/*.apk release/ticktick.x86.64.apk

    java -jar signer.jar --allowResign -a packages/ticktick/x86/output -o packages/ticktick/x86/output/release
    mv -v packages/ticktick/x86/output/release/*.apk release/ticktick.x86.apk

    java -jar signer.jar --allowResign -a packages/tiktok/output -o packages/tiktok/output/release
    mv -v packages/tiktok/output/release/*.apk release/tiktok.apk

    java -jar signer.jar --allowResign -a packages/twitch/output -o packages/twitch/output/release
    mv -v packages/twitch/output/release/*.apk release/twitch.apk

    java -jar signer.jar --allowResign -a packages/twitter/output -o packages/twitter/output/release
    mv -v packages/twitter/output/release/*.apk release/twitter.apk

    java -jar signer.jar --allowResign -a packages/youtube.music/64.v8a/output -o packages/youtube.music/64.v8a/output/release
    mv -v packages/youtube.music/64.v8a/output/release/*.apk release/yt.music.64.v8a.apk

    java -jar signer.jar --allowResign -a packages/youtube.music/v7a/output -o packages/youtube.music/v7a/output/release
    mv -v packages/youtube.music/v7a/output/release/*.apk release/yt.music.v7a.apk

    java -jar signer.jar --allowResign -a packages/youtube.music/x86.64/output -o packages/youtube.music/x86.64/output/release
    mv -v packages/youtube.music/x86.64/output/release/*.apk release/yt.music.x86.64.apk

    java -jar signer.jar --allowResign -a packages/youtube.music/x86/output -o packages/youtube.music/x86/output/release
    mv -v packages/youtube.music/x86/output/release/*.apk release/yt.music.x86.apk

    java -jar signer.jar --allowResign -a packages/youtube/output -o packages/youtube/output/release
    mv -v packages/youtube/output/release/*.apk release/youtube.apk
fi

echo "REMOVING CACHE"
rm -rf *.jar

echo "DONE SIGNING"

