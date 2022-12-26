echo "DECLARING VARIABLES"
declare -A artifacts

artifacts["uber-apk-signer.jar"]="patrickfav/uber-apk-signer uber-apk-signer .jar"

get_artifact_download_url()
{
    local api_url result
    api_url="https://api.github.com/repos/$1/releases/latest"
    result=$(curl -s $api_url | jq ".assets[] | select(.name | contains(\"$2\") and contains(\"$3\") and (contains(\".sig\") | not)) | .browser_download_url")
    echo "${result:1:-1}"
}

echo "CLEANING UP"
if [[ "$1" == "clean" ]]
    then
    rm -f uber-apk-signer.jar
    exit
fi

echo "FETCHING DEPENDENCIES"
for artifact in "${!artifacts[@]}"
do
    if [ ! -f "$artifact" ]
    then
        echo "Downloading $artifact"
        curl -sLo "$artifact" $(get_artifact_download_url ${artifacts[$artifact]})
    fi
done

echo "PREPARING"
mkdir -p packages/icon.pack.studio/output/release
mkdir -p packages/nyx/output/release
mkdir -p packages/reddit/output/release
mkdir -p packages/spotify/output/release
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

    mv -v packages/manager/*.apk packages/latest/app/revanced.manager.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/icon.pack.studio/output -o packages/icon.pack.studio/output/release
    mv -v packages/icon.pack.studio/output/release/icon.pack.studio-aligned-debugSigned.apk packages/latest/app/icon.pack.studio.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/nyx/output -o packages/nyx/output/release
    mv -v packages/nyx/output/release/nyx-aligned-debugSigned.apk packages/latest/app/nyx.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/reddit/output -o packages/reddit/output/release
    mv -v packages/reddit/output/release/reddit-aligned-debugSigned.apk packages/latest/app/reddit.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/spotify/output -o packages/spotify/output/release
    mv -v packages/spotify/output/release/spotify-aligned-debugSigned.apk packages/latest/app/spotify.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/tiktok/output -o packages/tiktok/output/release
    mv -v packages/tiktok/output/release/tiktok-aligned-debugSigned.apk packages/latest/app/tiktok.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/twitch/output -o packages/twitch/output/release
    mv -v packages/twitch/output/release/twitch-aligned-debugSigned.apk packages/latest/app/twitch.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/twitter/output -o packages/twitter/output/release
    mv -v packages/twitter/output/release/twitter-aligned-debugSigned.apk packages/latest/app/twitter.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/youtube/output -o packages/youtube/output/release
    mv -v packages/youtube/output/release/youtube-aligned-debugSigned.apk packages/latest/app/youtube.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/youtube.music/v7a/output -o packages/youtube.music/v7a/output/release
    mv -v packages/youtube.music/v7a/output/release/yt.music.v7a-aligned-debugSigned.apk packages/latest/app/yt.music.v7a.apk

    java -jar uber-apk-signer.jar --allowResign -a packages/youtube.music/v8a/output -o packages/youtube.music/v8a/output/release
    mv -v packages/youtube.music/v8a/output/release/yt.music.v8a-aligned-debugSigned.apk packages/latest/app/yt.music.v8a.apk
fi

echo "DONE SIGNING"
