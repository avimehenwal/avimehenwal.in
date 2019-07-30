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
- diff
---

## How to read git diff output?

{{< code numbered="true" >}}
diff --git [[[a/content/blog/everything-great-about-git.md]]] [[[b/content/blog/everything-great-about-git.md]]]
index 18123c7..00c8696 [[[100644]]]
--- a/content/blog/everything-great-about-git.md
[[[+++]]] b/content/blog/everything-great-about-git.md
@@ [[[-7]]],3 +7,[[[3]]] @@ series:
- myLearning
[[[-]]]categories:
[[[+]]]categories:
 - development
[[[@@ -14,4 +14,25 @@]]] tags:
 - bisect
+- diff
 ---
{{< /code >}}

1. Old/original file
2. new file version being diffed to
3. `100644` means that it is ordinary file and not e.g. symlink, and that it doesn't have executable permission bit
4. Symbols used for both files
5. the original file, starting on line 7
6. has 3 lines before this diff was applied.
7. `+` A line was added here to the first file.
8. `-` A line was removed here from the first file.
8. start of new **hunk** `@@ -start,count +start,count @@`

## How to view git diff

{{% cmd %}}
git diff
{{% /cmd %}}

Shows the changes between the working directory and the index. This shows what has been changed, but is not staged for a commit.

{{% cmd %}}
git diff --cached / --staged
{{% /cmd %}}

Shows the changes between the index and the HEAD (which is the last commit on this branch). This shows what has been added to the index and staged for a commit.

{{% cmd %}}
git diff HEAD
{{% /cmd %}}

Shows all the changes between the working directory and HEAD (which includes changes in the index). This shows all the changes since the last commit, whether or not they have been staged for commit or not.

`git diff myfile.txt`
: If you want to see what you haven't git added yet:

`git diff --cached myfile.txt`
: or if you want to see already added changes

Another exciting use-case is to check for leading and trailing whitespaces in your file
`git diff --check`

Check whitespaces only on python files
```
$ git diff --name-only HEAD~1 HEAD | grep \.py$ | \
$ xargs git diff --check HEAD~1 HEAD --
```

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

{{% note %}}
    Git by default uses 3-way merge which adds a extra commit message at the time of merge
{{% /note %}}

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

## Rebase - rewrite history

{{% ticks %}}
  1. Amend last/previous commits - `git commit --amend --no-edit`
  2. reword older commit messages - `git rebase -i HEAD~3` to operate on last 3 commit messages. Change `pick` to `reword`
  3. delete commit messages - `git rebase` and then change `pick` to `drop`
  4. Reorder commit messages - run `rebase` adn change order of commits in interactive mode
  5. Squash commit messages - `rebase` and use `fixup` or `squash`
  6. split commit messages - use `edit` then `git reset HEAD^` to unstage files and then stage/commit them in the order you want.
{{% /ticks %}}

{{% warning %}}
  Make a copy of branch before proceeding
{{% /warning %}}

{{< code numbered="true" >}}
    git checkout -b working-on-backup-branch
    git rebase -i [[[master]]]

    [[[pick   SHA <older commit message>
    squash SHA <older commit message>
    squash SHA <older commit message>]]]
{{< /code >}}

1. rebase current branch **on** master. Rebase will compute diff for each commit and add it to master incrementally.
2. squash 2 commit messages into the first one. Might take a while, as git recalculates everything when rewriting history.

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

## git hooks use-cases

1. Linting - Check the quality of the code before committing
2. Auto generate documentation as changes are uploaded
3. Spell checks

### pre-commit hook checklist

- are relevant files added
- are irrelevant files removed from staging
- Review untracked files
- Would you like to lint
- Would you like to spellcheck

### Work on multiple branches?

{{% cmd %}}
    git worktree
{{% /cmd %}}

* separate checkout in a different directory
  * cheaper
  * shared objects and config

### Related work

* [python, pre-commit.com](https://pre-commit.com/)
* [enforce cmt-message standards](https://github.com/Krakakanok/Conventional-Commits-Git-Hook/blob/master/commit-msg)

### Footnotes

[^1]: [Git hooks, practical uses](https://www.tygertec.com/git-hooks-practical-uses-windows/)
[^2]: [atlassian git-hook tutorial](https://www.atlassian.com/git/tutorials/git-hooks)
[^3]: [git merge | git rebase](https://hackernoon.com/git-merge-vs-rebase-whats-the-diff-76413c117333)
[^4]: [What is git rebase](https://gist.github.com/leesmith/8441773)