echo "MAKING DIRECTORIES"
mkdir -p packages/icon.pack.studio/versions
mkdir -p packages/nyx/versions
mkdir -p packages/reddit/versions
mkdir -p packages/tiktok/versions
mkdir -p packages/twitch/versions
mkdir -p packages/twitter/versions
mkdir -p packages/youtube/versions
mkdir -p packages/youtube.music/v7a/versions
mkdir -p packages/youtube.music/v8a/versions

echo "COPYING LATEST VERSION FILES"
cp -p -v assets/versions/latest/versions.json packages/icon.pack.studio/versions
cp -p -v assets/versions/latest/versions.json packages/reddit/versions
cp -p -v assets/versions/latest/versions.json packages/tiktok/versions
cp -p -v assets/versions/latest/versions.json packages/twitch/versions
cp -p -v assets/versions/latest/versions.json packages/twitter/versions
cp -p -v assets/versions/latest/versions.json packages/youtube/versions
cp -p -v assets/versions/latest/versions.json packages/youtube.music/v7a/versions
mv -v assets/versions/latest/versions.json packages/youtube.music/v8a/versions

echo "MOVING PATCH FILES"
cp -p -v assets/patches/universal.patch packages/icon.pack.studio
mv -v assets/patches/universal.patch packages/nyx
mv -v assets/patches/reddit.patch packages/reddit
mv -v assets/patches/spotify.patch packages/spotify
mv -v assets/patches/tiktok.patch packages/tiktok
mv -v assets/patches/twitch.patch packages/twitch
mv -v assets/patches/twitter.patch packages/twitter
mv -v assets/patches/youtube.patch packages/youtube
cp -p -v assets/patches/youtube.music.patch packages/youtube.music/v7a
mv -v assets/patches/youtube.music.patch packages/youtube.music/v8a

echo "COPYING REVANCED INTEGRATIONS"
cp -p -v assets/temp/integrations/*.apk packages/icon.pack.studio/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/nyx/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/reddit/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/spotify/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/tiktok/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/twitch/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/twitter/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/youtube/integrations.apk
cp -p -v assets/temp/integrations/*.apk packages/youtube.music/v7a/integrations.apk
mv -v assets/temp/integrations/*.apk packages/youtube.music/v8a/integrations.apk

echo "COPYING REVANCED CLI"
cp -p -v assets/temp/cli/*.jar packages/icon.pack.studio/cli.jar
cp -p -v assets/temp/cli/*.jar packages/nyx/cli.jar
cp -p -v assets/temp/cli/*.jar packages/reddit/cli.jar
cp -p -v assets/temp/cli/*.jar packages/spotify/cli.jar
cp -p -v assets/temp/cli/*.jar packages/tiktok/cli.jar
cp -p -v assets/temp/cli/*.jar packages/twitch/cli.jar
cp -p -v assets/temp/cli/*.jar packages/twitter/cli.jar
cp -p -v assets/temp/cli/*.jar packages/youtube/cli.jar
cp -p -v assets/temp/cli/*.jar packages/youtube.music/v7a/cli.jar
mv -v assets/temp/cli/*.jar packages/youtube.music/v8a/cli.jar

echo "COPYING REVANCED PATCHES"
cp -p -v assets/temp/patches/*.jar packages/icon.pack.studio/patches.jar
cp -p -v assets/temp/patches/*.jar packages/nyx/patches.jar
cp -p -v assets/temp/patches/*.jar packages/reddit/patches.jar
cp -p -v assets/temp/patches/*.jar packages/spotify/patches.jar
cp -p -v assets/temp/patches/*.jar packages/tiktok/patches.jar
cp -p -v assets/temp/patches/*.jar packages/twitch/patches.jar
cp -p -v assets/temp/patches/*.jar packages/twitter/patches.jar
cp -p -v assets/temp/patches/*.jar packages/youtube/patches.jar
cp -p -v assets/temp/patches/*.jar packages/youtube.music/v7a/patches.jar
mv -v assets/temp/patches/*.jar packages/youtube.music/v8a/patches.jar

echo "DONE COPYING FILES"
