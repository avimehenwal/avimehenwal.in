---
title      : "12 Juli Friday"
date       : 2019-07-12T08:47:37+02:00
draft      : true
comments: false
revision: 0
weight: 5
series:
- DailyLogs
categories:
- embedded
tags:
- grub
- git
- mender
---

## How to reset bootloader configurations

Remove the jumper from CMOS clock or the entire battery, press and hold power button for sometime 20 sec to discharge.

## git bisect - debugging code for culprit commit

* At what time was the code still good?
* use `git bisect` to find out when was bug was introduced?
* Use binary search to drill down to bad commit
* it accepts feedbacks good|bad before presenting the culprint commit

```bash
git bisect start
git bisect terms
git bisect bad <commitid>
git bisect next (y)
git bisect good <commitid>
git bisect log
git bisect visualize
git bisect reset 
```

## git merge vs git rebase[^1]

* git merge introduced all commits from the feature branches
* what if? we want all the changes done in a branch as a single commit to master
  * `git merge --squash` followed by a `git commit`
* goal of both *merge* and *rebase* is to put commits from feature to master branch
* git merge takes all the commits and adds them to master in a single merge commit
* rebase moves all the commits from banch on top to master branch
* rebase preserves the order of commit

```bash
git merge --squash <feature>
```

> Extract a file to a particular directory path

```bash
tar -C /usr/local -xzf go1.12.7.linux-amd64.tar.gz
```



## Mender + grub



### Footnotes

[^1]: [What is git rebase](https://gist.github.com/leesmith/8441773)
[^2]: [Roderick W. Smith -linux expert](https://www.rodsbooks.com/)
