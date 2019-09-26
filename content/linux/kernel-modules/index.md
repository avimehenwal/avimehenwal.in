---
title      : "Kernel Modules"
date       : 2019-09-26T09:20:04Z
publishdate: 2019-09-26T09:20:04Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- modules
---

Kernel modules are pieces of code that can be loaded and unloaded into the kernel upon demand.
They extend the functionality of the kernel without the need to reboot the system[^1]

1. Built-in kernel modules
2. Lodable kernel modules

<!-- more -->
> To dynamically load or remove a module, it has to be configured as a loadable module in the kernel configuration (the line related to the module will therefore display the letter `M`)

ko
: kernle objects

so
: 

KMOD - kernel modules
: a loadable kernel module is an object file that contains code to extend the running kernel

## Commands

* How to list all loadble kernel modules? `lsmod`
* How to get module information? `modinfo`
* How to dynamically add/remove kernel modules? ` modprobe -c | less`
* Automatically loading kernel modules using systemd? `/etc/modules-load.d`
* Manually reoad/unload a kernel module? `modprobe --remove kvm`
* Kernel Modules path on filesystem? `ls -la /lib/modules/(uname --kernel-release) `

## Questions

1. How to create/write a kernel module?
   1. https://github.com/fishinabarrel/linux-kernel-module-rust
   2. https://github.com/tsgates/rust.ko

### Footnotes

[^1]: https://wiki.archlinux.org/index.php/Kernel_module
[^2]: https://en.wikipedia.org/wiki/Loadable_kernel_module
