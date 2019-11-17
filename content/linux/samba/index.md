---
title      : "Samba Server"
date       : 2019-11-15T14:04:01Z
publishdate: 2019-11-15T14:04:01Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- samba
---

tl;dr
<!-- more -->

```
sudo apt update
sudo apt install samba

whereis samba

sudo smbpasswd -a username

# Test samba config
testparm

sudo systemctl status smbd
sudo systemctl restart smbd

```



### Footnotes

[^1]: https://tutorials.ubuntu.com/tutorial/install-and-configure-samba#0
[^2]:
