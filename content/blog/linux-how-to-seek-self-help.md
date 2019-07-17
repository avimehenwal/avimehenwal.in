---
title      : "Linux How to Seek Self Help"
date       : 2019-07-13T10:44:21+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories: 
- development
- Linux
tags:
- apropos
- tee
---

Linux system seek self-help even when you are offline.

## apropos

is a command to search the man page files in Unix and Unix-like operating systems.[^1]
* apropos takes its name from the English word with the same spelling that means relevant.
* It is particularly useful when searching for commands without knowing their exact names.

```
apropos mount
apropos spell
```

### [Where are man pages stored in Ubuntu?](https://superuser.com/questions/318555/where-are-man-pages-stored-in-ubuntu)

## cmd line interactive spell checker

```
aspell check content/about.md

# list all configs
aspell dump config
```

## tee command

Write to a file as well as print output on *stdout*

```
date | tee --append myLog.log
date | tee /dev/tty | rev
```

### Footnotes

[^1]: [wiki, aprops](https://en.wikipedia.org/wiki/Apropos_(Unix))
[^2]: 
