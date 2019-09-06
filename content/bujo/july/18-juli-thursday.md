---
title      : "18 Juli Thursday"
date       : 2019-07-18T10:40:24+02:00
draft      : true
comments: false
revision: 0
weight: 5
series:
- DailyLogs
categories:
- embedded
tags:
- linux
- yocto
---

df - disk free
: display the amount of available disk space for file system
* `df --human-readable`
* `df` doesnt show partitions, rather Filesystems
* `df -h -x tmpfs -x devtmpfs``

[rootfs / ramfs][1]
: `rootfs` is a special instance os `tempfs` image used in initram
* [`tmpfs` (aka `ramfs`) partitions][1] are mounted from an *internal RAM disk*
* You can't unmount rootfs

du - disk usage
: `du -ks`

linux commands

```
cat /sys/class/block/sda/size

# determine the size of block device
blockdev --getsize64 /dev/sda
cat /proc/partitions
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

### Questions

> How to change partitions sizes? Extend partitions?
> fdisk
>



### Footnotes

[1]: https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
[^2]:
