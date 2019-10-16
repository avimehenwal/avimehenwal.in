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

Kernel modules[^3] are pieces of code that can be loaded and unloaded into the kernel upon demand.
They extend the functionality of the kernel without the need to reboot the system[^1]

1. Built-in kernel modules
2. Lodable kernel modules

<!-- more -->
> To dynamically load or remove a module, it has to be configured as a loadable module in the kernel configuration (the line related to the module will therefore display the letter `M`)

ko
: kernle objects

so
: Shared Objects
* The advantage of .so (shared object) over .a library is that they are linked during the runtime i.e. after creation of your .o file -o option in gcc. So, if there's any change in .so file, you don't need to recompile your main program. But make sure that your main program is linked to the new .so file with ln command.
* files are loaded in `python pip` modules like `spidev`

KMOD - kernel modules
: a loadable kernel module is an object file that contains code to extend the running kernel

## Commands

* How to list all loadble kernel modules? `lsmod`
* How to get module information? `modinfo`
* How to dynamically add/remove kernel modules? ` modprobe -c | less`
* Move the kernel modules to device FS
  * `cd /build/bbb/tmp/deploy/ipk/beaglebone_yocto`
  * `scp kernel-module-adis16400-4.18.25-yocto-standard_4.18.25+git0+9e348b6f9d_28e7781d57-r0_beaglebone_yocto.ipk root@192.168.120.141:/home/root`
* Installl the pkg `opkg install`
* Path on device `/lib/modules/4.18.25-yocto-standard/kernel/drivers/iio/imu`
* Automatically loading kernel modules using systemd? `/etc/modules-load.d`
* Manually reoad/unload a kernel module? `modprobe --remove kvm`
* Kernel Modules path on filesystem? `ls -la /lib/modules/(uname --kernel-release) `


## Debug Kernel

It is assumed that we already know how to compile a kernel, use menuconfig and what kernel options are.

* https://github.com/torvalds/linux/blob/ab486bc9a591689f3ac2b6ebc072309371f8f451/lib/Kconfig.debug
* [Configure sensors](https://github.com/paulgortmaker/yocto-kernel-cache/blob/407d294c09edcf78de7ca4615af90befbac77ce1/features/iio/iio.cfg)

## Questions

1. How to create/write a kernel module?
   1. https://github.com/fishinabarrel/linux-kernel-module-rust
   2. https://github.com/tsgates/rust.ko
2. Have you compiled the linux kernel yourself?

### Footnotes

[^1]: https://wiki.archlinux.org/index.php/Kernel_module
[^2]: https://en.wikipedia.org/wiki/Loadable_kernel_module
[^3]: https://wiki.gentoo.org/wiki/Kernel_Modules
