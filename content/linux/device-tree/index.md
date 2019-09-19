---
title      : "Device Tree"
date       : 2019-09-06T12:18:24+02:00
publishdate: 2019-09-07T12:18:24+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- embedded
- os
tags:
- device-tree
---

AMP
: Asymmetric Multiprocessing

DMA
: Direct Memory Access

DTB
: Device tree Blob

DTC
: Device Tree Compiler

DTS
: Device Tree Syntax

SoC
: System on Chip

Slides[^1]

* The Device Tree should describe the board's hardware
* is a data structure describing the hardware components of a particular computer so that the operating system's kernel can use and manage those components, including the CPU or CPUs, the memory, the buses and the peripherals.
* A device tree can hold any kind of data as internally it is a tree of named nodes and properties
* Can have multiple `compatibility` drivers for a device


### Footnotes

[^1]: http://events17.linuxfoundation.org/sites/events/files/slides/dt_internals.pdf
[^2]: https://elinux.org/Device_Tree_Usage#Understanding_the_compatible_Property
