---
title: Everything Great About Git
date: 2019-07-10T07:59:47.000+00:00
weight: "5"
revision: "0"
series:
- myLearning
categories:
- development
tags:
- git

---
## Git Hooks

Allows us to run custom scripts whenever certain important events occour in the Git
life-cycle, such as commiting, merging, pushing etc[^1].

Some use-cases which could be achieved using hooks[^2]

1. trigger emails before commits
2. Respond to a commit event by firing a code-linting job before commiting
3. **pre** to prevent the event on failure
4. **post** to respond to a event
5. prevent commit if your name and email are incorrect

{{% note %}}
    Git doesn't care which scripting languague you are using to write hooks.
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

> Save hooks in your dotfiles. carry them with you wherever you go

### Footnotes

[^1]: [Git hooks, practical uses](https://www.tygertec.com/git-hooks-practical-uses-windows/)
[^2]: [atlassian git-hook tutorial](https://www.atlassian.com/git/tutorials/git-hooks)