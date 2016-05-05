# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Git Theory

| Objectives |
| :--- |
| *Students will be able to:* |
| Describe the use of fetch, merge, and pull |
| Make a new repository and add another student as a collaborator |
| Create and resolve their first merge conflict |


### Review Git Branching

A branch in git is just a label on a particular commit in a repository, along with all of its history (parent commits). When we commit, the current branch label moves forward to the new commit. Another way to say that is the branch label always stays at the tip of the branch.

> `HEAD` indicates the point on the repository that we're reading from. When we run `git branch`, new branches get added at wherever `HEAD` points. If 'HEAD' is pointing at the end of a branch, it also means that new commits will be added to that branch.

![Git Branch Diagram](https://www.atlassian.com/git/images/tutorials/collaborating/using-branches/01.svg)

> From [Atlassian - Git Branching Tutorial](https://www.atlassian.com/git/tutorials/using-branches/git-branch)

Q. Why is branching an important part of git?
---

> A. Branches are useful for many reasons, but some of the most common ones:

> 1. To allow experimentation. By switching to a new branch, we can experiment,
and if the experiment fails, we can delete it and easily switch back to master
(or another branch of our choice). If it succeeds, we can merge those changes
into master.
2. To allow work to proceed on multiple features (or by multiple people) without
interfering. When a feature is complete, it can be merged back into master.
3. To allow easy bug fixes on a stable version while features are being developed.

## `git fetch`, `git merge`, and `git pull`

Fetching, merging, and pulling are related commands that you will frequently use to update your local repository to include your collaborator's work.

[`git fetch`](https://git-scm.com/docs/git-fetch) gets all of the updates from the remote repositories without changing the location of the local HEAD.

[`git merge`](https://git-scm.com/docs/git-merge) joins two different places in your development tree. This is frequently used to bring together your changes with the changes you just fetched. If you were on branch `add-auth` and you had just `git fetch`'d updates from the remote, you could then `git merge origin/add-auth`. This would join your changes and the changes that had been made to this branch on origin. You also commonly use merge to pull changes from one branch into another so that your current branch doesn't become out of date while you work.

[`git pull`](https://git-scm.com/docs/git-pull) is the combination of fetching and merging to the newly fetched version of the current branch.

## Create a merge conflict

1. Pair up. Have one partner create a brand new repository on GitHub and [add your partner as a collaborator](https://help.github.com/articles/adding-collaborators-to-a-personal-repository/).
2. The person who created the GitHub repository should create a new rails app locally, generate one controller, edit the readme, and push the newly scaffolded app to the remote repository.
3. The collaborator should then clone this repository.
4. Now, both people should change the readme completely, and add 2 methods to the created controller. Make sure one of the methods you create has the same name, but has different functionality.
5. Now, have the original repo creator commit and push the work to GitHub.
6. The collaborator should commit their changes and then `git pull`.
7. We hope that we have created a merge conflict. [Resolve the merge conflict](https://github.com/SF-WDI-LABS/shared_modules/blob/master/how-to/github-collaboration-workflow.md#resolving-merge-conflicts-locally) on one of your computers and push the fixes to GitHub.  
8. BONUS: Create a feature branch
8. Feel free to delete this dummy repository from your local machine and from GitHub. This workflow was intentionally sloppy and I'm hoping that you learned a little bit of what *not* to do.


## Real Workflow

Read this [GitHub Collaboration Workflow](https://github.com/SF-WDI-LABS/shared_modules/blob/master/how-to/github-collaboration-workflow.md) document to get an idea of how you should actually be working!
