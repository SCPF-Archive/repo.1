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
Go to `Actions` tab.

![Actions Tab](https://add.pics/images/2022/12/29/IMG_20221229_213615.jpeg)

---

#### Step 4
Click the `All workflows`.

![All Workflows](https://add.pics/images/2022/12/29/IMG_20221229_213911.jpeg)

---

#### Step 5
Click the `Release Latest`.

![Release Latest](https://add.pics/images/2022/12/29/IMG_20221229_214041.jpeg)

---

#### Step 6
Click the `Run workflow`.

![Run Workflow](https://add.pics/images/2022/12/29/IMG_20221229_214624.jpeg)

> Note: You can also check the `Archive Packages` checkbox to release the builds as a compressed `.7z` archive file.

---

#### Step 7
Download the built apps in the releases.

</details>

# Changelog
- Changed CLI Repo ([a487933](https://github.com/SCPF-Archive/repo.1/commit/a4879331c420fc28e4c1a7a55c83f0461a68e8fa)).
- Fixed Errors ([#3](https://github.com/SCPF-Archive/repo.1/pull/3)) ([b7e44ff](https://github.com/SCPF-Archive/repo.1/commit/b7e44ff412bfa47d0bffabcebdd4e3438c76ed36)).
- Fixed GitHub Token ([5557534](https://github.com/SCPF-Archive/repo.1/commit/55575344eba08c2c897c3b5e6675ea098645bc68)).

# Failed Patches
- `hide-premium-navbar` ([#621](https://github.com/revanced/revanced-patches/issues/621))
- `feed-filter` ([#1305](https://github.com/revanced/revanced-patches/issues/1305))
- `hide-views-stats` ([#1394](https://github.com/revanced/revanced-patches/issues/1394))
