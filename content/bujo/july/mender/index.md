---
title      : "Mender"
date       : 2019-07-12T08:47:37+02:00
draft      : false
comments: false
revision: 0
weight: 5
series:
- DailyLogs
categories:
- embedded
tags:
- grub
- bootloader
---

## How to reset bootloader configurations

Remove the jumper from CMOS clock or the entire battery, press and hold power button for sometime 20 sec to discharge.

## Linux images

Note: the difference between 'zImage' files and 'bzImage' files is that
'bzImage' uses a different layout and a different loading algorithm,
and thus has a larger capacity.  Both files use gzip compression.
The 'bz' in 'bzImage' stands for 'big zImage', not for 'bzip'!

## Boot and root partition

* [System partition and boot partition](https://en.wikipedia.org/wiki/System_partition_and_boot_partition)
* [Is a /boot partition always necessary?](https://superuser.com/questions/522971/is-a-boot-partition-always-necessary)

```
scp -v skysails-mastercontrol-image-genericx86-64.mender root@192.168.122.36:/data
/etc/fstab
/etc/mender/artifact_ingo
/sbin/init.sh
fw_printenv

mender -rootfs /data/skysails-mastercontrol-image-genericx86-64.mender

................................  96% 139264 KiB
................................  97% 140288 KiB
................................  97% 141312 KiB
................................  98% 142336 KiB
................................  99% 143360 KiB
..........................INFO[0051] wrote 1072693248/1072693248 bytes of update to device /dev/sda3  module=device
.      100% 144224 KiB
INFO[0053] Enabling partition with new image installed to be a boot candidate: 3  module=device
```

After reboot

```
root@genericx86-64:~# lsblk --fs
NAME   FSTYPE LABEL    UUID                                 MOUNTPOINT
sda                                                         
|-sda1 vfat   efi      A5F1-6F37                            /boot/efi
|-sda2 ext4   rootfs_0 909242fd-11b5-4f29-a94f-44a3b8790faa 
|-sda3 ext4            e5a42c52-6bef-43c4-824a-5ea3ef4d817a /
|-sda4                                                      
|-sda5 ext4   config   93831baf-6c60-4883-96e0-3d6e78a55c8d 
`-sda6 ext4   data     6c4ce979-e364-4315-a346-9b9662f87c6f /data
```

Reboot again and `/` will change to `sda2`

```
root@genericx86-64:~# fw_printenv 
bootcount=1
mender_boot_part=3
upgrade_available=1
mender_boot_part_hex=3

#REBOOT

root@genericx86-64:~# fw_printenv 
bootcount=0
mender_boot_part=2
upgrade_available=0
mender_boot_part_hex=3

```

After upgrade, `.mender` file is lost


### Footnotes

[1]: [What is the difference between the following kernel Makefile terms: vmLinux, vmlinuz, vmlinux.bin, zimage & bzimage?](https://unix.stackexchange.com/questions/5518/what-is-the-difference-between-the-following-kernel-makefile-terms-vmlinux-vml)
[2]: [Roderick W. Smith -linux expert](https://www.rodsbooks.com/)
