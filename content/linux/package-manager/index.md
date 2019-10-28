---
title      : "Package Manager"
date       : 2019-09-18T15:35:06Z
publishdate: 2019-09-18T15:35:06Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- package
- manager
tags:
- apt
---

<!-- more -->
## APT - Advanced Package Tool[^1]

* Executable permission for directory to enter it
  * may make `ssh/config` unredable
* Add `sources.list` from debian
  * Add `debian` sources to `kali` in `/etc/apt/sources.list.d/`
    * Do not popullate `/etc/apt/sources.list`
* List Keys addes to `APT`
  * `apt-key list` 


```
chown --changes --from=avi:sudo --recursive avi:avi /home/avi/PersonalProjects/

```

> How to find out where the package is installed?

```
dpkg --listfiles python
```

### Footnotes

[^1]: https://en.wikipedia.org/wiki/APT_(Package_Manager)
[^2]:
