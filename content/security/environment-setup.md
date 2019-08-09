---
title      : "Environment Setup"
date       : 2019-08-09T22:50:57+02:00
publishdate: 2019-08-10T22:50:57+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Security
categories:
- development
tags:
---

[DKMS](https://wiki.archlinux.org/index.php/Dynamic_Kernel_Module_Support)
: Dynamic Kernel Module System
* Linux kernel modules whose sources generally reside outside the kernel source tree
<!-- more -->

```
apt install -y dkms linux-headers-$(uname -r)
```

VM guest additions module

Do not run tor as root, infact do not browse as root

### Footnotes

[^1]:
[^2]:
