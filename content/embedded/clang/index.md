---
title      : "C Language"
date       : 2019-10-16T12:22:51Z
publishdate: 2019-10-16T12:22:51Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Embedded
categories:
- programming
tags:
- c
- driver
---

<!-- more -->

## Linux Driver development


##  #define

`#define` is a **C preprocessor directive** used to define `macros`.

```
#define MACRONAME (expression)
```

##  dereference/ indirection operator

For example, in C

{{< code numbered="true" >}}
[[[int x]]];
[[[int *p]]];
{{< /code >}}

1. we can declare a variable x that holds an integer value,
2. and a variable p that holds a pointer to an integer value in memory:

## Essential Linux device drivers Toolbox

1. Peek inside Kernel
2. Kernel Facilities
   1. kernel threads
      1. are like user processes but they live in kernel space and have access to special kernel functions and data structures
   2. Kernel Interfaces
   3. Kernel APIs
3. Linux device model
   1. Character / char drivers -printers, watchdogs
   2. Serial drivers
      1. UARTS drivers
      2. TTY drivers
   3. Input drivers - keyboard, mouse
   4. USB drivers
      1. touch screens drivers
   5. Audio/ Video/ Block device drivers
   6. Network interface cards
   7. Wireless drivers - Bluetooth, Wifi, GPRS, CDMA
4. Embedding Linux
   1. Tool chains
   2. Bootloaders
   3. Memory Layout
5. Debugging drivers

### Introduction

* What is linux? where is the official source and mailing list? Where is the official source?
* How to buid linux from source?
* Linux has lodable modules `lsmod`
* Kernel mode and user mode aka user/kernel space
  * to effectively implement time-sharing system
* peek Internals of kernel from pseudo fs `proc` usuallt mounted at `/` root

> Kernel boot starts with the execution of real mode assembly code living in `/arch/x86/boot` directory

* [How to create a new kernel thread?](https://www.kernel.org/doc/html/latest/process/index.html)[^1]
  * `#include <linux/kthread.h>`

### What are devices and drivers?

> Schematics of device from vendor, Role of device driver?

* device nodes `/dev`
* drivers `/sys`
* useful abstractions provided by kernel by `sysfs`, `kobjects`, `device classes`, `udev`
* Hotplug and Coldplug? Whats the difference?
* SPI available in market today includes RF (radio frewquency) chips, smart card interfaces, EEPROM, RTC, touch sensor, ADCs
* Write a `Makefile` for your driver file
* Compilation would create a `.ko` file
* Load the `.ko` file
* Exporting/importing kernel symbol table
* `nm` - list symbols from object files



```
kernel headers
printk
KERNEL_ALERT

# Makefile
obj-m
```

### Footnotes

[^1]: https://blog.sourcerer.io/writing-a-simple-linux-kernel-module-d9dc3762c234
[^2]:
