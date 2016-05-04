| Objectives |
| :--- |
| *Students will be able to:* |
| Visualize and draw the structure of a multi-branch git repository |
| Produce a possible git command history for a given repository illustration |
| Create their own git branches and explain a pattern for using branches to develop a full application |

## Review
Quickly review the basics of git:

1. What is the purpose of git? How does it differ from github?

1. What command is used to start tracking a directory? What commands record the changes that occurred in the tracked directory?

1. Explain what a fork and a clone are.

1. What commands are used to share changes (commits) between local and remote repos?

## Drawing challenges:
1. Draw a git repository with one branch and 4 commits.
1. A git repository with two commits on `master` before a user branches to create a `new-feature` branch. `new-feature` has 5 commits of its own.
2. Same as above, but imagine `master` has 3 of its own commits after `new-feature` branches off.
1. Imagine that the previous illustration is the state of the repository on GitHub and that you are invited as a collaborator. You clone the repository and make 3 more commits to `new-feature`. Draw this *whole* situation, including the contrast between local and remote repositories.
1. Now imagine that a teammate had simultaneously done *the same thing* but had made 5 commits on `new-feature` and then had pushed those changes to GitHub. Draw the state of your local, the GitHub repo, and your teammate's local repository. Using color to specify the

## Git command challenge:
1. Give a series of git commands that could have produced a repository that looks like each of these ones:

  ![image](https://cloud.githubusercontent.com/assets/6520345/15020274/2d32158e-11d6-11e6-8981-79cfc2bc6682.png)

  ![image](https://cloud.githubusercontent.com/assets/6520345/15020605/8f8e77e4-11d7-11e6-913e-fb9dcb7d34cd.png)

  [Source](https://www.atlassian.com/git/tutorials/using-branches/git-branch)

<!-- 2. `git init`

  `git commit` x 2

  `git branch new-feature`

  `git checkout new-feature`

  `git commit` x 2

  `git checkout -b fixes`

  `git commit` x 2 -->


## Git branching tutorial

Do Levels 1-3 of this [git branching tutorial](http://pcottle.github.io/learnGitBranching/). Stop at 4: "Rebase Introduction".
Take your time:
Read all the dialogs. They are part of the tutorial.
Think about what you want to achieve
Think about the results you expect before you press enter.
Whenever you see/type `git commit`, it may help to assume changes have been made and staged. Why else would you "commit"?

## Development patterns

In Git, branches are a part of your everyday development process. When you want to add a new feature or fix a bug—no matter how big or how small—you spawn a new branch to encapsulate your changes. This makes sure that unstable code is never committed to the main code base, and it gives you the chance to clean up your feature’s history before merging it into the main branch 2.

Branches are incredibly lightweight "movable pointers" that help us as developers make experimental changes! A branch in git is just a label or pointer to a particular commit in a repository, along with all of it's history (parent commits).

What makes a branch special in git, is that we're always on a specific branch, and when we commit, the current branch HEAD moves forward to the new commit. Another way to say that is the HEAD always stays at the tip of the branch.

Terminology: HEAD is simply a reference to the current or most recent commit!



![image](https://cloud.githubusercontent.com/assets/6520345/15020568/663aa804-11d7-11e6-83f6-774e43bc2ea6.png)


A larger production version of this pattern might look like this:

![](http://nvie.com/img/git-model@2x.png)
[Source](http://nvie.com/posts/a-successful-git-branching-model/)
