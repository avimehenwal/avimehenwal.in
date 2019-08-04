---
title      : "Linux Container"
date       : 2019-08-04T16:03:06+02:00
publishdate: 2019-08-05T16:03:06+02:00
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- linux
tags:
- container
- docker
---

LXC
: Linux Containers
* provides whole OS like VMs

LXD
: Linux COntainer Deamon
* full linux OS
* its a machine container
* containers run as processes on host OS
* Linux only hypervisor, without a hypervisor, **lightvisor**
* virtual machines running at host **speed**
* provides isolation at kernel level using `cgroups` and `namespaces`

## LXC - Linux Containers

[Wikipedian page on LXC](https://en.wikipedia.org/wiki/LXC)

* is an **operating-system-level virtualization method** for running multiple isolated Linux systems (containers) on a control host using a **single Linux kernel**
* `cgroups` limitation and prioritazation of resources (CPU, memory, networking)
* `namespace isolation` isolation of working environment including `processes`, `networking`, `users` and `filesystems`
* we are virtualizing the operating system and not the hardware
* LXC works in the vanilla Linux kernel requiring no additional patches to be applied to the kernel sources
* [LXC source-code on github](https://github.com/lxc/lxc)


<!-- more -->

- Dont forget to configure *storage pool*
- [LXC commands](https://linuxcontainers.org/lxd/getting-started-cli/)

```
lxd init
lxc launch ubuntu:18.04 <name>
lxc stop <name>

sudo lxc list
sudo lxc image list
```

When it comes to a Linux distribution, however, you can do a lot of interesting things. Since what we call Linux is just the kernel and it needs a GNU stack of libraries to provide a complete OS

{{% note %}}
You can not run a custom kernel in a container architecture. Not feasable as of now
{{% /note %}}

> [Is LXD same as Docker?](https://unix.stackexchange.com/questions/254956/what-is-the-difference-between-docker-lxd-and-lxc) Which one is better and how?

LXD    - Machine container

Docker - process container

Docker was originall based on `LXD`, but now they have moved to their own libraries.

Both are containerization technologies. Container runtime environments
`LXD` and `Docker` are implementation technologies (software programs) owned by canonical and docker Inc respectively to
run linux-container on hosts proving user with an easy API interface to manage them.

We can use all these tools together. Docker can run a app side-by-side a LXC container. LXC container can run a docker.
Nested containerization is possible.

> KVM vs LXD

+ KVM will start with a BIOS, then a bootloader that loads its Kernel and OS-user space, followed by loading drivers and CPU-scheduling for application processes
+ LXD are thinner and removes lot of overhead

## Questions

* Hardware assists, supported h/w

### Footnotes

[^1]:
[^2]:
