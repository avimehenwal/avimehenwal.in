---
title      : "yocto"
date       : 2019-09-06T12:49:11+02:00
publishdate: 2019-09-07T12:49:11+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- embedded
- linux
tags:
- yocto
- embedded
---

> THE YOCTO PROJECT.  IT'S NOT AN EMBEDDED LINUX DISTRIBUTION, IT CREATES A CUSTOM ONE FOR YOU.

yocto
: that provides templates, tools and methods to help you create custom Linux-based systems for embedded products regardless of the hardware architecture
* create a nodejs enabled linux image for raspberrypi
* [wiki-yocto How_do_I](https://wiki.yoctoproject.org/wiki/How_do_I)
* means `10^24`
* lets you write OS for newly devloped IoT device like washing machine

## How to configure device tree using yocto

- dts file in linux-yocto recipe
- device tree blob (dtb)
- `fdtdump /boot/am335x-boneblack.dtb`
- Getting a property from device tree <key> <property>
  - `fdtget /boot/am335x-boneblack.dtb spi0 status`
- `make dtbs`

## List USB devices on linux

lsusb
: show you whether the kernel sees usb 3.0 support.

```
# List block devices
lsblk

dmesg | grep usb
lsusb --tree
blkid
```


iPXE
: is the leading open source network boot firmware.
* It provides a full PXE implementation enhanced with additional features such as:
* boot from a web server via HTTP
* boot from an iSCSI SAN
* boot from a Fibre Channel SAN via FCoE
* boot from an AoE SAN
* boot from a wireless network
* boot from a wide-area network
* boot from an Infiniband network
* control the boot process with a script

## Build Linux from scratch!

* `/boot`
  * has `initramfs` and device-tree files
  * makemenu configs
  * grub configs
* Linux boot in 8 secs to work with LCDs
* Able to change HDD size for vagrant VB provider VM, mark it as SSD

## Questions

1. How to change partitions sizes? Extend partitions
2. How to run `wic` image on virt-manager
3. [How to build ubuntu from scratch using yocto?](https://stackoverflow.com/questions/46725208/yocto-how-to-create-a-basic-ubuntu-16-04-linux)


### Footnotes

[^1]: https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
[^2]:
