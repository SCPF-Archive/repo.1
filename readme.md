# ReVanced Builder
**What?**
- A repository which downloads and patches the supported ReVanced application with the latest ReVanced CLI, Integrations, and Patcher and the applications can be downloaded in the repository release assets.

**Why?**
- Like what [**n0k0m3**](https://github.com/n0k0m3) said, I also made this repo to help people build ReVanced applications without setting up build environments on their machines or without using the ReVanced Manager.

**How?**
- Actually, I made this repo from scraping scripts and codes from the other repos here on GitHub so there's no really hard work from this repo.

# Notes
- The script will download the selected versions ([**see here**](/revanced/assets/versions)) of applications on **APK Mirror** and **UpToDown**, **NOT** the latest official version on Google Play.
- The applications are **NON-ROOT** variant so don't expect some **Magisk** modules here.
- Without **microG**, **YouTube** and **YouTube Music** will crash due to missing **microG**, please install **microG**.

# How to setup?
<details><summary>CLICK TO VIEW STEPS</summary>

#### Step 1.
Make sure you have a GitHub account, you can just [**create**](https://github.com/signup) or [**login**](https://github.com/login) your GitHub account to continue.

---

#### Step 2.
After you logged in your account, fork this repo by clicking this [**link**](https://github.com/SCPF-Archive/repo.1/fork).

---

#### Step 3


#### Step 7
Download the built apps in the releases.

</details>

# Changelog
- Fixed Patch Selection Error ([#4](https://github.com/SCPF-Archive/repo.1/pull/4))
- Changed CLI Repo ([a487933](https://github.com/SCPF-Archive/repo.1/commit/a4879331c420fc28e4c1a7a55c83f0461a68e8fa))
- Fixed Patching Errors ([#3](https://github.com/SCPF-Archive/repo.1/pull/3))
- Fixed GitHub Token ([5557534](https://github.com/SCPF-Archive/repo.1/commit/55575344eba08c2c897c3b5e6675ea098645bc68))

# Failed Patches
- `hide-premium-navbar` ([#621](https://github.com/revanced/revanced-patches/issues/621))
- `feed-filter` ([#1305](https://github.com/revanced/revanced-patches/issues/1305))
- `hide-views-stats`
