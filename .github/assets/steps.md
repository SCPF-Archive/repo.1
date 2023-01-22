## 🤔How to setup?

#### Step 0:
You need to have a GitHub account for the following steps.

#### Step 1:
Fork this repository.
- [**How to fork a repository?**](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
- To fork this repository on desktop or mobile browser, kindly click [**here**](https://github.com/SCPF-Archive/repo.1/fork).
> **DO NOT FORK** if you need to set the new repo to private, import this repository instead. I recommend to fork this repo instead of importing so you can update your repository whenever there's an update on the main repository.

![IMG 001](/.github/assets/img.001.jpg)

#### Step 2:
After you forked or imported this repository and made your own repo, go now to your GitHub Actions tab.

![IMG 002](/.github/assets/img.002.jpg)

#### Step 3:
Click the `I understand my workflows, go ahead and enable them.`.

![IMG 003](/.github/assets/img.003.jpg)

#### Step 4:
After you enabled the workflows, click the `Release Latest`.

![IMG 004](/.github/assets/img.004.jpg)

#### Step 5:
Click the `Run workflow`.

![IMG 005](/.github/assets/img.005.jpg)

#### Step 6:
Click the `Run workflow` button to generate the applications.
> In the checkboxes, you can put a check the `Archive Packages` to release the applications in a compressed .7z archive instead.

> The estimated time length of the workflow run is about 20 minutes.

![IMG 006](/.github/assets/img.006.jpg) 

#### Step 7:
After the workflow is finished (when the indicator is now **green colored** with **check mark**), click your repository name above.

![IMG 007](/.github/assets/img.007.jpg)

#### Step 8:
Download your generated applications in the releases section.

You can visit it by typing this to the the URL:
> `/releases/latest`
>
> `github.com/YourUserName/YourRepoName/releases/latest`
>
> Example:
> `github.com/Ultimatinium/revanced-repo/releases/latest`

Or you can click the `Releases`

> Example:
>
> ![IMG 008](/.github/assets/img.008.jpg)

#### Step 9:
After you redirected to the releases section, you can now download your applications.

![IMG 009](/.github/assets/img.009.jpg)

---

#### Reminder 1:
Don't forget to always check and update these folders :

- [**Patches Folder**](revanced/assets/patches)
- [**Versions Folder**](revanced/assets/versions)

> Those folders are meant to be checked and updated.

#### Reminder 2:
When you see that you are `# commit/s behind`, update your repo by clicking the `Sync fork` -> `Update branch`.

![IMG 010](/.github/assets/img.010.jpg)
