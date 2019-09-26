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
---

dimdecode
: Desktop Management Interface
* Doesnt query and probe the hardware
* queries System Managed BIOS, hence info could be unreliables

OEM
: Original Equipment Manufacturer
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
3. 

## Memory RAM

* Works on `pages`, which are written and read very fast by system
* `virtual memory` space borrowed from **HDD** to store pages which do not change frequently


> Can I mix and match memories? Like samsung and kingston

You **may/maynot** run into compatibilty issues sue to specs followed by vendors
BUy RAM with same speeds

### Footnotes

[^1]: [Kernel | microkernel | linux](https://github.com/nu11secur1ty/Kernel-and-Types-of-kernels)
[^2]: [OS Comparision](https://en.wikipedia.org/wiki/Comparison_of_operating_system_kernels)
