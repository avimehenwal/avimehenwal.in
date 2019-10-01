---
title      : "File System"
date       : 2019-08-09T19:02:54+02:00
publishdate: 2019-08-10T19:02:54+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- filesystem
- grep
- partitions
---

## What is Filesysem?

- Hierarical data-structure
<!-- more -->
[Linke to linux FS notes](https://docs.google.com/document/d/e/2PACX-1vQY6TqYjKTnNEUWjS3Av0vboq-NhuZ04w7b5wVfHGzX_qF26a_FRTY3dD-RM-8y6bNPAGr8ZcVous63/pub)

## Searching with GREP

Search for PATTERN am33xx at LOCATION ./build/, but include only '*.dtb' files for searching
```
grep --recursive --include='*.dtb' am33xx ./build/

--files-with-matches
```

## Partitions

Formattting a external mounted drive

```
fdisk /dev/sdb
dd if=/dev/zero of=/dev/sdb  bs=512  count=1
fdisk -l /dev/sdb
```

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

### Footnotes

[^1]:
[^2]:
