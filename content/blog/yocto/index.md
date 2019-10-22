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
- `./tools/run_in_container.sh build ./tools/build/bitbake.sh build/bbb nas.pb.avantys.de:/mnt/nas/data/Projekte/SkySails/os/yocto-thud linux-yocto -c devshell`
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
- [How to configure device tree using yocto](#how-to-configure-device-tree-using-yocto)
- [List USB devices on linux](#list-usb-devices-on-linux)
- [Build Linux from scratch!](#build-linux-from-scratch)
- [Questions](#questions)
- [Bitbake Recipe](#bitbake-recipe)
- [Devtools yocto recipe](#devtools-yocto-recipe)
  - [Footnotes](#footnotes)

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

## Bitbake Recipe

LICENSE
: The type of license. This is set to unknown because devtool cannot recognize the old MIT text.

LIC_FILES_CHKSUM
: devtool looks in the root of the source folder for a file called LICENSE, and generates a checksum to ensure checkout has been successful.

SRC_URI
: The git repo given in the 'devtool add' command. This is where the source will be pulled from.

PV
: The package version. Usually taken from recipe filename (e.g. bbexample_0.1.bb would automatically set PV = "0.1")

SRCREV
: the git revision to checkout. ${AUTOREV} means HEAD and must be used during app development. It should be set a specific commit before being added to a layer.

S
: Where the source can be found after being fetched and unpacked.

inherit autotools
: Use a bitbake class that can configure, build and install an autotools project
* `autoconf` and `automake`

EXTRA_OECONF
: Options to be passed to configure script. In this case it is empty, so is not necessary.

DEPENDS
:  means a build-time dependency

RDEPENDS
: Runtime dependency
* https://lists.yoctoproject.org/pipermail/yocto/2013-August/015811.html

* Automatically create yocto recipes from using `devtool`
  * [Yocto Project SDK](https://www.yoctoproject.org/docs/2.8/sdk-manual/sdk-manual.html#sdk-installing-the-extensible-sdk)
* Caution - Do not use recipe name followed by `-` (hyphen), use underscore for versioning instead

## Devtools yocto recipe

* `hexdump` utility is part of `bsdmainutils` package. Alternatively, you could use xxd from the `xxd package`
* Meta Recipies-devtools[^2]
* [Search for prebuilt recipies](http://layers.openembedded.org/layerindex/branch/master/layer/meta-oe/)

> How to installl python packages on yocto?

* [Bitbake OE recipies](http://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python)
* 




### Footnotes

[^1]: https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
[^2]: https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-devtools/
