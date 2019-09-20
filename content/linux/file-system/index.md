---
title      : "File System"
date       : 2019-08-09T19:02:54+02:00
publishdate: 2019-08-10T19:02:54+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- filesystem
- grep
---

## What is Filesysem?

- Hierarical data-structure
<!-- more -->
[Linke to linux FS notes](https://docs.google.com/document/d/e/2PACX-1vQY6TqYjKTnNEUWjS3Av0vboq-NhuZ04w7b5wVfHGzX_qF26a_FRTY3dD-RM-8y6bNPAGr8ZcVous63/pub)

## Searching with GREP

Search for PATTERN am33xx at LOCATION ./build/, but include only '*.dtb' files for searching
```
grep --recursive --include='*.dtb' am33xx ./build/

--files-with-matches
```


### Footnotes

[^1]:
[^2]:
