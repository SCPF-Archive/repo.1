# ReVanced Builder

**What?**
- A repository which downloads and patches the supported ReVanced application with the latest ReVanced CLI, Integrations, and Patcher and the applications can be downloaded in the repository release assets.

**Why?**
- Like what [**n0k0m3**](https://github.com/n0k0m3) said, I also made this repo to help people build ReVanced applications without setting up build environments on their machines or without using the ReVanced Manager.

**How?**
- Actually, I made this repo from scraping scripts and codes from the other repos here on GitHub so there's no really hard work from this repo.

## 🗒️Notes
<details><summary><b>Click to View</b></summary>

- The script will download the selected versions ([**see here**](/revanced/assets/versions)) of applications on **APK Mirror** and **UpToDown**, **NOT** the latest official version on Google Play.
- The applications are **NON-ROOT** variant so don't expect some **Magisk** modules here.
- Without **microG**, **YouTube** and **YouTube Music** will crash due to missing **microG**, please install **microG**.

</details>

## 🤔How to setup?
<details><summary><b>Click to View</b></summary>

1. Fork this repo. DO NOT FORK if you need to set the new repo to private.
2. That's it! You can now build ReVanced using Github Actions.
3. Modify your desired custom patches [**here**](revanced/assets/patches).

</details>

## 📝Changelog
<details><summary><b>Click to View</b></summary>

- Prerequisites and Versions ([**#7**](https://github.com/SCPF-Archive/repo.1/pull/7))
- Add Backdrops Wallpapers ([**#6**](https://github.com/SCPF-Archive/repo.1/pull/6))
- Add Citra Emulator ([**#5**](https://github.com/SCPF-Archive/repo.1/pull/5))
- Return To Official CLI ([**9c68a07**](https://github.com/SCPF-Archive/repo.1/commit/9c68a07fcba836bc06ca74bee36a1fea15f025c0))
- Fixed Patch Selection Error ([**#4**](https://github.com/SCPF-Archive/repo.1/pull/4))
- Changed CLI Repo ([**a487933**](https://github.com/SCPF-Archive/repo.1/commit/a4879331c420fc28e4c1a7a55c83f0461a68e8fa))
- Fixed Patching Errors ([**#3**](https://github.com/SCPF-Archive/repo.1/pull/3))
- Fixed GitHub Token ([**5557534**](https://github.com/SCPF-Archive/repo.1/commit/55575344eba08c2c897c3b5e6675ea098645bc68))

</details>

## 🐞Bugs
<details><summary><b>Click to View</b></summary>

Reddit
- Patches Doesn't Apply
- `general-reddit-ads` ([**#1177**](https://github.com/revanced/revanced-patches/issues/1177))
- `premium-icon-reddit`

Spotify
- `hide-premium-navbar` ([**#621**](https://github.com/revanced/revanced-patches/issues/621))

TikTok
- `downloads`
- `feed-filter` ([**#1305**](https://github.com/revanced/revanced-patches/issues/1305))
- `settings`
- `sim-spoof`
- Java Heap Space ([**#1358**](https://github.com/revanced/revanced-patches/issues/1358))

</details>

## 🖤 Credits
<details><summary><b>Click to View</b></summary>

[**ReVanced**](https://github.com/revanced)
- Obviously for the CLI, Patches, and Integrations that is used in this repo.

[**n0k0m3**](https://github.com/n0k0m3)
- For almost all the codes and scripts from here.

[**inotia00**](https://github.com/inotia00)
- For the microG that is used in this repo.

[**Termux**](https://github.com/termux)
- For the [upload-release-action](https://github.com/termux/upload-release-action).

[**robinraju**](https://github.com/robinraju)
- For the [release-downloader](https://github.com/robinraju/release-downloader).

</details>
