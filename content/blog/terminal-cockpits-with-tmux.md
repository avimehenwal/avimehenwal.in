---
title      : "Terminal Cockpits With Tmux"
date       : 2019-07-18T22:09:55+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- deployment
tags:
- linux
- tmux
---

tmux
: terminal multiplexer to quickly switch to app
* tmux-session for applications
* [sample](https://github.com/avimehenwal/dotfiles/commit/c5785ea9809582ecc777f007269773cabada97b3)

## Use cases

1. watch all your repo status - call it repo dashboard
   * `watch 'git status'`
2. pair-programming and share terminal


## Session Management

`tmux new -s session_name`
: creates a new tmux session named session_name

`tmux attach -t session_name`
: attaches to an existing tmux session named session_name

`tmux switch -t session_name`
: switches to an existing session named session_name

`tmux list-sessions`
: lists existing tmux sessions

`tmux detach (prefix + d)`
: detach the currently attached session

## Window Management

tmux new-window (prefix + c)
: create a new window

`tmux select-window -t :0-9 (prefix + 0-9)`
: move to the window based on index

`tmux rename-window (prefix + ,)`
: rename the current window

`tmux split-window (prefix + ")`
: splits the window into two vertical panes

`tmux split-window -h (prefix + %)`
: splits the window into two horizontal panes

`tmux swap-pane -[UDLR] (prefix + { or })`
: swaps pane with another in the specified direction

`tmux select-pane -[UDLR]`
: selects the next pane in the specified direction

`tmux select-pane -t :.+`
: selects the next pane in numerical order

`tmux list-keys`
: lists out every bound key and the tmux command it runs

`tmux list-commands`
: lists out every tmux command and its arguments

`tmux info`
: lists out every session, window, pane, its pid, etc.

`tmux source-file ~/.tmux.conf`
: reloads the current tmux configuration (based on a default tmux config)

### Footnotes

[^1]:
[^2]:
