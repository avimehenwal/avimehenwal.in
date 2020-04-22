---
title      : "btrfs"
date       : 2020-02-20T10:33:38Z
publishdate: 2020-02-20T10:33:38Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Linux
categories:
- file-system
tags:
- btrfs
---

## B-tree FS

* `copy-on-write` **COW** principle[^1]
  * Underlying mechanism for **snapshots** as provided by `LVM`
  * Weak form of incremental backup
  * copy-on-write usually refers to the first technique. CoW does two data writes compared to ROW's one; it is difficult to implement efficiently and thus used infrequently.
  * The `qcow2` (QEMU copy on write) disk image format uses the copy-on-write technique to reduce disk image size.
* In computer storage, **logical volume management** or `LVM` provides a method of allocating space on mass-storage devices that is more flexible than conventional partitioning schemes to store volumes
* Btrfs is intended to address the `lack of pooling`, **snapshots**, `checksums`, and `integral multi-device spanning` in Linux file systems.
* btrfs status[^2]
* Snapshot
  * A snapshot is simply a `subvolume` that shares its data (and metadata) with some other subvolume, using Btrfs's COW capabilities.



### Footnotes

[^1]: https://en.wikipedia.org/wiki/Btrfs
[^2]: https://btrfs.wiki.kernel.org/index.php/Status
