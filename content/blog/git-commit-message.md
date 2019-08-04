---
title: Awesome Git Commit Message
date: "2019-06-24T22:30:58+02:00"
weight: 5
revision: 1
series:
- myLearning
categories:
- development
tags:
- git
- commit
---

> Why care about commit message anyways? What's the need?


We write commit message to get a glance of development activity. Hence writing Awesome commit message might mean people scouring through git logs would be able to understand development activity better and faster.

## some tips to write awesome git commit messages.

1. Use present tense: **add awesome-package**, not **added ...**
2. Use preceding subsystem when applicable: **registry: add theme foobar**
3. 50 characters or less for the first line of your commit
4. Use of emoji is free[^1]

{{% note %}}
  [Use git commit message to close PRs and issues on GitHub's Automated kanban project board](https://help.github.com/en/articles/closing-issues-using-keywords)
{{% /note %}}

## [Anatomy of a commit message](https://chris.beams.io/posts/git-commit/)

> [It's all connected](https://about.gitlab.com/2016/03/08/gitlab-tutorial-its-all-connected/)

#### Examples of well crafted repositories

While many repositories’ logs look like the former, there are exceptions. The Linux kernel and Git itself are great examples. Look at Spring Boot, or any repository managed by Tim Pope.

```
Subject in IMPERATIVE

Explanation, what, why
```

imperative verbs
: Soften
* Add
* Fix
* Rewrite
* Avoid
* Close
* Document
* Refactor
* Optimize

* Reference
  - To reference an issue: `#123`
  - To reference a MR: `!123`
  - To reference a snippet `$123`
- strive for <mark>atomic commits</mark>

## How to automate this process?

commit-msg
: git commit hook [to check/lint commit messages for issue IDs]({{< relref "blog/everything-great-about-git/index.md#git-hooks" >}})
* [sample OSM commit-msg hook](http://osm.etsi.org/gerrit/tools/hooks/commit-msg)

```
git log --pretty=oneline --abbrev-commit \
| cut --delimiter=' ' --fields=1 --complement \
| grep '\[.*\]' --count
```

[github/commit-msg-linter npm](https://github.com/legend80s/commit-msg-linter)

## git staged | unstaged files

Even after `git add`ing your files and later changing them, git may again ask you to stage
your files! Why is that?

when you change a file which is already in the repository, you have to git add it <mark>again</mark> if you want it to be staged.

This allows you to commit only a subset of the changes you made since the last commit. For example, let's say you have file a, file b and file c. You modify file a and file b but the changes are very different in nature and you don't want all of them to be in one single commit. You issue

```
git add a
git commit file_a -m "bugfix, in a"
git add b
git commit file_b -m "new feature, in b"

# if you want to commit everything you can just type
git commit -a
```

{{% note %}}
  Add a precommit hook to stage files for commit. Have a abbr already created for it,
  just call it before commit.
{{% /note %}}

### How to unstage a file?

`git rm --cached <filePath>` does not unstage a file, it actually **stages the removal of the file(s) from the repo** (assuming it was already committed before) but leaves the file in your working tree (leaving you with an untracked file). **will unstage the file for future commits also**. It's unstaged until it gets added again with git add <file>.

`git reset -- <filePath>` will **unstages the file in the current commit.**


## Footnotes

[^1]: [use emoji on github](https://www.webfx.com/tools/emoji-cheat-sheet/)