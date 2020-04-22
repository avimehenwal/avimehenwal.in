---
title      : "yocto Build System"
date       : 2019-09-06T12:49:11+02:00
publishdate: 2019-09-07T12:49:11+02:00
draft      : false
comments   : true
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
* **Eg:** create a nodejs enabled linux image for raspberrypi
* [wiki-yocto How_do_I](https://wiki.yoctoproject.org/wiki/How_do_I)
* means `10^24`
* lets you write OS for newly devloped IoT device like washing machine

SDK
: A software development kit (SDK) is a collection of software development tools in one installable package
* backend, api, frontend in 1 package
* specific to a hardware platform and operating system combination


## How to configure device tree using yocto

- `linux-yocto` kernel (or whichever is being used)
- dts file in linux-yocto recipe
- device tree blob (dtb)
- `fdtdump /boot/am335x-boneblack.dtb`
- Getting a property from device tree <key> <property>
  - `fdtget /boot/am335x-boneblack.dtb spi0 status`

{{< code numbered="true" >}}
bitbake-layers show-recipes [[[-i]]] kernel [[[-r]]]
{{< /code >}}

1. Recipies which `inherit` kernel `.bbclass` as all kernel recipies should inherit it
2. List recipe name only

```sh
# Configure before devshell else might face SYNCCONFIG error
./tools/run_in_container.sh build ./tools/build/bitbake.sh build/bbb nas.pb.avantys.de:/mnt/nas/data/Projekte/SkySails/os/yocto-thud linux-yocto -c clean
./tools/run_in_container.sh build ./tools/build/bitbake.sh build/bbb nas.pb.avantys.de:/mnt/nas/data/Projekte/SkySails/os/yocto-thud linux-yocto -c configure
./tools/run_in_container.sh build ./tools/build/bitbake.sh build/bbb nas.pb.avantys.de:/mnt/nas/data/Projekte/SkySails/os/yocto-thud linux-yocto -c devshell

make dtbs
```

## List USB devices on linux

lsusb
: show you whether the kernel sees usb 3.0 support.

```sh
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


## Bitbake

* BitBake is a make-like build tool with the special focus of distributions and packages for embedded Linux cross compilation
* BitBake recipes specify how a particular package is built
* Recipes consist of the source URL (http, https, ftp, cvs, svn, git, local file system) of the package, dependencies and compile or install options
*

## Questions

1. How to change partitions sizes? Extend partitions?
   1. Use `fdisk --list /dev/part` command
   2. `wks` File
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
: [GNU Build System Tools](https://ast.wikipedia.org/wiki/GNU_build_system)
* `GNU Autoconf`, `GNU Automake` and `GNU lib tool`

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

## Yocto

- `linux-yocto` recipe layer has actual linux kernel versions


## Devtools yocto recipe

* `hexdump` utility is part of `bsdmainutils` package. Alternatively, you could use xxd from the `xxd package`
* Meta Recipies-devtools[^2]
* [Search for prebuilt recipies](http://layers.openembedded.org/layerindex/branch/master/layer/meta-oe/)

> How to installl python packages on yocto?

* [Bitbake OE recipies](http://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python)

```sh
# Show layer dependencies
bitbake-layers layerindex-show-depends meta-python
# Add layer inside poky
bitbake-layers layerindex-fetch meta-oe
```


## How to update yocto build system?

- `MAJOR.Minor.patch`
- [Yocto release process, every 6 months](https://wiki.yoctoproject.org/wiki/Yocto_Project_Release_Process)
- `Poky` is the reference distro the Yocto Project releases with each Yocto Project release. These releases are named releases (danny, dora, dylan, edison, etc.) as well as numbered utilizing Major.minor.patch numbering.
-

## Yocto kernels

* [yocto kernel Documentation](https://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html)
  * `PREFFERED_PROVIDER_virtual/kernel = `
*  how to set up your build host to support kernel development
*

```sh
devtool modify linux-yocto

# Add Recipies
IMAGE_INSTALL_append = "gtk+3"
EXTRA_IMAGE_FEATURES += " package-management "
```

## Efficient

1. Build dashboards - toaster
2. Error Reporting - Dashboards


## Cool Features

* [ ] [Skip building recipies BBMASK](https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-BBMASK)
* [ ]



### Footnotes

[^1]: https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
[^2]: https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-devtools/
[^3]: http://events17.linuxfoundation.org/sites/events/files/slides/Yocto-upgrades-ELC-2017.pdf
[^4]: [i.MX or NXP energy efficient ARM based processor](https://www.karo-electronics.com/de/produkte/produktauswahl)

