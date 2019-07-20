---
title      : "Fzf the File Fuzzy Finder"
date       : 2019-07-14T05:07:12+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories: 
- development
tags:
- fzf
---

Start finder on entries that start with core and end with either go, rb, or py:

```
fzf -q "^core go$ | rb$ | py$"
```

Start finder on entries that not match pyc and match exactly travis:

```
fzf -q "!pyc 'travis"

# search md files within a folder with live preview
fzf -q 'content/blog/ md$' --preview 'cat {} | head -30'
```

## FZF Previews with BAT

```
bat --list-themes | fzf --preview="bat --theme={} --color=always /path/to/file"

fzf -q '.md' --color=always --preview='bat --theme=<> --language <bash> {}' 

```

### Footnotes

[^1]: 
[^2]: 
