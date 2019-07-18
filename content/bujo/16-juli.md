---
title      : "16 Juli"
date       : 2019-07-16T00:19:44+02:00
draft      : true
comments: false
revision: 0
weight: 5
series:
- DailyLogs
categories:
- frontend
- history
tags:
- linux
---

## setting limits to resources

free
: to check memory resources consumption

crontab -l
: run periodic jobs on system

[Limit memory usage for a single Linux process](https://unix.stackexchange.com/questions/44985/limit-memory-usage-for-a-single-linux-process)

## How to update terminal text without repainting? How to overwrite a line

* repaint terminal
* commandline
  * get/set current commandline buffer
  * If commandline is called during a call to complete a given string using complete -C STRING, commandline will consider the specified string to be the current contents of the command line.
* use \r instead of \n
* ncurses

TUI APplication

* dialog
  * --msgbox
  * --yesno
  * --infobox
  * --textbox
  * --inputbox
  * --menu
  * --guage
* zenity

* Terminals offer control sequences to control color, font, cursor position and more
* Terminal interprets escape sequences

```
echo -n first
sleep 1
echo -ne "\rsecond"
echo

for f in (seq 0 100)
    printf '%s\r' (string repeat -n $f -- '#')
    sleep 0.01s
end

for i in (seq 9)
    echo -n $i\b
    sleep 0.5s
end

for i in (seq 0 10 100)
    echo $i | dialog --guage "Working..." 10 35
    sleep 0.5s
end

ls (zenity --file-selection --directory)
```

## Questions

1. write a vue.js based terminal app?[^1]

### Footnotes

[^1]: [Create a Terminal Program with Vue.js and blessed-vue](https://alligator.io/vuejs/blessed-vue-terminal/)
[^2]:
