---
title      : "File System"
date       : 2019-08-09T19:02:54+02:00
publishdate: 2019-08-10T19:02:54+02:00
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
- dd
- parted
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


## Searching filesystem with GREP

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

* Formattting a external mounted drive
* [Sparse Images](https://en.wikipedia.org/wiki/Sparse_image)

If you’re familiar with disk structure, you know that disks are broken down into sectors, which are typically 512 bytes in size; all Read or Write operations occur in multiples of the sector size. When you look more closely, hard disks include extra data between sectors. The disk uses these extra bytes to detect and correct errors within each sector.

When the sector size is increased from 512 bytes to a larger value, more efficient and powerful error-correction algorithms can be used. Thus, changing to a larger sector size has two practical benefits: improved reliability and greater disk capacity — at least in theory.

### Add space to wic image size, inplace

* `/dev/zero` [Add zeros to the wic image](https://en.wikipedia.org/wiki//dev/zero)

```
cp mastercontrol-image-genericx86-64--20191212115741.wic 123.wic
dd status=progress bs=1G if=/dev/zero of=./space.img count=1
bat ./space.img >> 123.wic
sudo cfdisk 123.wic 
```

### dd command - copying filesystems

{{% note %}}
`dd` command copies sector by sector, so the final image will be the same size.
{{% /note %}}

* Why would the disk image be so large?
* Is it going to equal the size of the partition?
* Is there a way to keep the disk image to just the size of the actual space used?
* Is there a better tool to use?

1. dd makes a **byte-for-byte** copy, so the total size of the partition matters, not what's in the partition.
2. Yes. It will grow to 220 GB.
3. You can compress the resulting image using gzip or xz:
```
sudo dd if=/dev/sda1 | xz > /tmp/ubuntu.image
```
4. Depends on what you call a better tool. For some tasks, a byte-for-byte copy is needed (say, data recovery from a failing disk). In such cases, dd + compression is the simplest way. If not, consider something like partimage .

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

## GParted tool

{{< code numbered="true" >}}

sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s rm 6
sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s rm 5
sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s rm 4

sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s print free

sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s mkpart extended 4243968s 8471055s
sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s mkpart logical ext4 4243969s 5471055s 
sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s mkpart logical ext4 5471057s 8471055s

sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s print free

sudo parted --script skysails-mastercontrol-image-genericx86-64.wic unit s mkpart extended 4243968s 8471055s
Warning: The resulting partition is not properly aligned for best performance.

{{< /code >}}


### Block size versus sector size

In Linux, disk sector size can be determined with

```
fdisk -l | grep "Sector size
```

and block size can be determined with

```
blockdev --getbsz /dev/sda.[10]
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


## Mounting and unmounting filesystems

{{< code numbered="true" >}}
mount
umount [[[-a]]]
fuser [[[-km]]] /data
{{< /code >}}

1. Unmount all devices from filesystems
2. Kill all processses using filesystem at location

### Footnotes

[^1]:
[^2]:
