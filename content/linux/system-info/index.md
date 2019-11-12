---
title      : "System Information"
date       : 2019-09-15T23:31:11+02:00
publishdate: 2019-09-15T23:31:11+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- sysadmin
- embedded
tags:
- sysinfo
- drivers
---

dimdecode
: Desktop Management Interface
* Doesnt query and probe the hardware
* queries System Managed BIOS, hence info could be unreliables

OEM
: Original Equipment Manufacturer

Device Driver
: a computer program that operates or controls a particular type of device that is attached to a computer.
<!-- more -->

{{< code numbered="true" >}}
sudo dmidecode [[[--dev-mem /dev/mem]]]
sudo dmidecode [[[--type]]] memory

sudo lshw -class memory
{{< /code >}}

1. Query 
2. There are 42 types refer man dmidecode
   1. `--type` flag could take following values
   2. bios, system, baseboard, chassis, processor, memory, cache, connector, slot

{{< code numbered="true" >}}
cat [[[/proc/cmdline]]]
root=/dev/mmcblk0p2 init=/sbin/init.sh
{{< /code >}}

1. From proc filesystem

* Linux is easily portable to most general-purpose 32- or 64-bit architectures as long as they have a paged memory management unit (PMMU) and a port of the GNU C compiler (gcc) (part of The GNU Compiler Collection, GCC).
* Linux has also been ported to itself. You can now run the kernel as a userspace application - this is called ***UserMode Linux (UML)**
* To configure and build the kernel, use[^3]
   1. make menuconfig
* The kernel’s command-line parameters, basically its a very big and complicated CLI program
* `xz`, a lossless data compression file format based on the **LZMA algorithm**, often with the file extension ".xz"
* **PTY** - Pseudo terminals
* Writing drivers for linux systems

## Drivers - Kernel Programming

> Could be a physical device or a virtual device (like a Instance of device)

Block Device driver
: any device which has a filesystem on it
* provides you random access to date to traverse back and forth

Character Driver
: stream of data to be processed
* Keyboard and Mouse

> Kernal provides ways to load and release drivers from user space. Like flashdrive driver



## Memory RAM

* Works on `pages`, which are written and read very fast by system
* `virtual memory` space borrowed from **HDD** to store pages which do not change frequently


> Can I mix and match memories? Like samsung and kingston

You **may/maynot** run into compatibilty issues sue to specs followed by vendors
BUy RAM with same speeds

### Footnotes

[^1]: [Kernel | microkernel | linux](https://github.com/nu11secur1ty/Kernel-and-Types-of-kernels)
[^2]: [OS Comparision](https://en.wikipedia.org/wiki/Comparison_of_operating_system_kernels)
[^3]: https://www.kernel.org/doc/html/v4.10/admin-guide/README.html?highlight=device%20tree
