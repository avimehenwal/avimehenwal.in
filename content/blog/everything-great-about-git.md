---
title      : "Everything Great About Git"
date       : 2019-07-10T09:59:47+02:00
weight     : 5
revision   : 0
series:
- myLearning
categories: 
- development
tags:
- git
- merge
- rebase
- bisect
---

## git bisect - debugging code for culprit commit

* use `git bisect` to find out when was bug was introduced?
* At what time was the code still good?
* Uses binary search to drill down to bad commit
* it accepts feed backs *good|bad* before presenting the culprit commit

```bash
git bisect start
git bisect terms
git bisect bad <commit-id>
git bisect next (y)
git bisect good <commit-id>
git bisect log
git bisect visualize
git bisect reset 
```

## git merge vs git rebase[^3]

* git merge introduced all commits from the feature branches[^4] into master with a special merge commit.
* what if? we want all the changes done in a branch as a single commit to master
  * `git merge --squash` followed by a `git commit`
* goal of both *merge* and *rebase* is to put commits from feature to master branch
* git merge takes all the commits and adds them to master in a single merge commit
* rebase moves all the commits from branch on top to master branch
* rebase preserves the order of commit
* Both of these commands are designed to integrate changes from one branch into another branch—they just do it in very different ways.
* This creates a new “merge commit” in the feature branch that ties together the histories of both branches, giving you a branch structure that looks like this:
* feature branch will have an extraneous merge commit every time you need to incorporate upstream changes
* If master is very active, this can pollute your feature branch’s history quite a bit
* Follow the [golden rule of rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing#the-golden-rule-of-rebasing)

```bash
git merge --squash <feature>

# update your feature branch with changes from master before working
git checkout feature
git rebase master -i
```


## Git Hooks

Allows us to run custom scripts whenever certain important events occur in the Git
life-cycle, such as committing, merging, pushing etc[^1].

Some use-cases which could be achieved using hooks[^2]

1. trigger emails before commits
2. Respond to a commit event by firing a code-linting job before committing
3. **pre** to prevent the event on failure
4. **post** to respond to a event
5. prevent commit if your name and email are incorrect

{{% note %}}
    Git doesn't care which scripting language you are using to write hooks.
    Just use the appropriate **shebang header** like `/bin/fish` etc
{{% /note %}}

Git hook sample already under `/.git/hooks` directory

{{% fileTree %}}
* /.git/hooks
  * update.sample*
  * applypatch-msg.sample*
  * commit-msg.sample*
  * fsmonitor-watchman.sample*
  * post-update.sample*
  * pre-applypatch.sample*
  * pre-commit.sample*
  * prepare-commit-msg.sample*
  * pre-push.sample*
  * pre-rebase.sample*
  * pre-receive.sample*
{{% /fileTree %}}

{{% warning %}}
    git hooks are NOT saved along with source code repo by default
{{% /warning %}}

> Save hooks in your dot-files. carry them with you wherever you go

### Global hooks

Reuse your hooks in every project

{{% cmd %}}
    git config --global core.hooksPath /path/to/global/hooks
{{% /cmd %}}

## git hooks usecases

1. Lynting - Check the quality of the code before committing
2. Auto generate documentation as changes are uploaded
3. Spell checks

### pre-commit hook checklist

- are relevant files added
- are unrelevant files removed from staging
- Review untracked files
- Would you like to lynt
- Would you like to spellcheck

### Work on multiple branches?

{{% cmd %}}
    git worktree
{{% /cmd %}}

* seperate checkout in a different directory
  * cheaper
  * shared objects and config
* 

### Related work

* [python, pre-commit.com](https://pre-commit.com/)
* [enforce cmt-message standards](https://github.com/Krakakanok/Conventional-Commits-Git-Hook/blob/master/commit-msg)

### Footnotes

[^1]: [Git hooks, practical uses](https://www.tygertec.com/git-hooks-practical-uses-windows/)
[^2]: [atlassian git-hook tutorial](https://www.atlassian.com/git/tutorials/git-hooks)
[^3]: [git merge | git rebase](https://hackernoon.com/git-merge-vs-rebase-whats-the-diff-76413c117333)
[^4]: [What is git rebase](https://gist.github.com/leesmith/8441773)