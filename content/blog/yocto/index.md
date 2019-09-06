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

yocto
: that provides templates, tools and methods to help you create custom Linux-based systems for embedded products regardless of the hardware architecture
* create a nodejs enabled linux image for raspberrypi
* [wiki-yocto How_do_I](https://wiki.yoctoproject.org/wiki/How_do_I)

## How to configure device tree using yocto

- dts file in linux-yocto recipe
- device tree blob (dtb)
- `fdtdump /boot/am335x-boneblack.dtb`
- Getting a property from device tree <key> <property>
  - `fdtget /boot/am335x-boneblack.dtb spi0 status`
- `make dtbs`

## List USB devices on linux

```
# List block devices
lsblk

dmesg | grep usb
lsusb --tree
blkid
```

### Footnotes

[^1]:
[^2]:
