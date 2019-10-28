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

## Various filesystems in Linux

1. sysfs
2. tempfs
3. procfs
4. debugfs


## Searching with GREP

{{% note %}}
Grep comes from old computer days reg-ex searchs `g/re/p` global re search!
{{% /note %}}

Search for PATTERN am33xx at LOCATION ./build/, but include only '*.dtb' files for searching
```
grep --recursive --include='*.dtb' am33xx ./build/

--files-with-matches
```

* `rsync` is a friend to move things around - incremental copying
* `mkdir $(ls | cut -d. -f1)`

```
$(cat README) - Run this command and give me the output
<(cat README) - Run command, hook it to a File Descriptor and
                then give me the path of FD

# Treat any resource like a file
grep google <(curl --silent http://google.com)
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

## Proc Filesystem

> Everything running is a process

* In memory pseudo (virtual) Filesystem, whichi gets built at each reboot
  * Explains why file size is `0` for all files insode `/proc`
* regarded as a control and information centre for the kernel
* Has directories created with process names
  * `echo $fish_pid` or `echo $$` will have a dir
* Process directory has associated `FD` file descriptors info
* All process and kernel states are stored in proc file system
* `/proc/PID/maps` (containing the currently mapped memory regions and their access permissions)
* `/proc/PID/status` (get the status information of a process)
* `/proc/PID/smaps` (is an extension based on maps, showing the memory consumption for each of the process's mappings)
* /proc/meminfo (Provides information about distribution and utilization of memory)
* /proc/vmallocinfo (Provides information about vmalloced/vmaped areas)
* /proc/net/dev (Can use this information to see which network devices are available in your system and how much traffic was routed over those devices)
* /proc/net ( tcp, udp, tcp6, udp6, igmp, ecc)

> List whichi processes have current file opened?

* `lsof /var/log/syslog`
* Process that are using a linux library 
  * `lsof /lib/x86/libssl.so`
* What is this user upto?
  * `lsof --user dave`

```
# Network sockets

lsof -i TCP
lsof -i UDP
lsof -i :80
lsof -i -n -P | grep
```

## FD - Files descriptors

Symbols | Meanings
--------|-----------
2 | stderr
3 | stdout
9w | care about writing only

> Where is a progess logging into?

`lsof -p PID | grep log`


## sysfs

* exports information about various kernel subsystems, hardware devices, and associated device drivers from the kernel's device model to user space through virtual files
* 

## initramfs

```
# You can upgrade kernel and keep it getting upgraded to future point Ubuntu releases by running
sudo apt install linux-generic-hwe-18.04

update-initramfs -u

```

[How to remove old kernel versions from boot menu](https://linoxide.com/booting/remove-old-kernel-versions-boot-menu/)

### Footnotes

[^1]:
[^2]:
