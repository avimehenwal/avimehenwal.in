---
title      : "Linux Container"
date       : 2019-08-04T16:03:06+02:00
publishdate: 2019-08-05T16:03:06+02:00
comments   : true
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

LXD
: Linux Container Deamon
* full linux OS
* it's a <mark>machine container</mark>
* containers run as processes on host OS
* Linux only hypervisor, without a hypervisor, **lightvisor**
* provides isolation at kernel level using `cgroups` and `namespaces`
* + virtual machines running at host **speed**
* WRitten on top of `LXC` using `golang`.
* [Source Code](https://github.com/lxc/lxd)
* [Available images list](https://us.images.linuxcontainers.org/)

## LXC - Linux Containers

[Wikipedian page on LXC](https://en.wikipedia.org/wiki/LXC)

* LXC is a userspace interface for the Linux kernel containment features[^1]
* create and manage **system** or **application** containers
* currently implemented using `libvirt`
* provides whole OS like VMs[^1]
* is an **operating-system-level virtualization method** for running multiple isolated Linux systems (containers) on a control host using a **single Linux kernel**
* `cgroups` limitation and prioritization of resources (CPU, memory, networking)
* `namespace` isolation of working environment including `processes`, `networking`, `users` and `filesystems`
* we are virtualizing the operating system and not the hardware
* LXC works in the vanilla Linux kernel requiring no additional patches to be applied to the kernel sources
* [LXC source-code on github](https://github.com/lxc/lxc)
- Dont forget to configure *storage pool*
- [LXC commands](https://linuxcontainers.org/lxd/getting-started-cli/)
<!-- more -->

LXC containers can be of two kinds:

1. Privileged containers
2. Unprivileged containers

### Sample LXC commands

```sh
lxd init
lxc launch ubuntu:18.04 <name>
lxc exec <name> -- /bin/bash
lxc stop <name>
sudo lxc list
sudo lxc image list
lxc launch images:kali kali

# Set the password for user
lxc exec first -- /bin/bash
passwd ubuntu
exit
lxc console first

sudo usermod --append --groups lxd avi

lxc image list ubuntu:
# provides a login shell for the preconfigured account ubuntu inside the container
lxc exec webserver -- sudo --login --user ubuntu

PORT=80 PUBLIC_IP=your_server_ip CONTAINER_IP=your_container_ip \
sudo -E bash -c 'iptables -t nat -I PREROUTING -i eth0 -p TCP -d $PUBLIC_IP --dport $PORT -j DNAT --to-destination $CONTAINER_IP:$PORT -m comment --comment "forward to the Nginx container"'
sudo iptables -t nat -L PREROUTING

lxc remote list
lxc storage list
lxc image list images:cent
lxc profile show default
lxc profile edit <custom>
lxc file push myfile myfile/root

free -m
nproc
```
Here's how the command breaks down:

-t nat specifies that we're using the nat table for address translation.
-I PREROUTING specifies that we're adding the rule to the PREROUTING chain.
-i eth0 specifies the interface eth0, which is the default public interface on Droplets.
-p TCP says we're using the the TCP protocol.
-d $PUBLIC_IP specifies the destination IP address for the rule.
--dport $PORT: specifies the destination port (such as 80).
-j DNAT says that we want to perform a jump to Destination NAT (DNAT).
--to-destination $CONTAINER_IP:$PORT says that we want the request to go to the IP address of the specific container and the destination port.

## How to restrict resources

```
lxc config set ubuntu18 limits.memory 512MB
# verify
free -m
```

{{% note %}}
When it comes to a Linux distribution, however, you can do a lot of interesting things. Since what we call Linux is just the kernel and it needs a **GNU stack** of libraries to provide a complete OS

You can not run a custom kernel in a container architecture. Not feasable as of now
{{% /note %}}

## Common Questions

> [Is LXD same as Docker?](https://unix.stackexchange.com/questions/254956/what-is-the-difference-between-docker-lxd-and-lxc) Which one is better and how?

Technology | container type
|-----------------------|----------------------------|
LXD  | machine container |
Docker | process container

Docker was originally based on `LXD`, but now they have moved to their own libraries.

Both are containerization technologies. Container runtime environments
`LXD` and `Docker` are implementation technologies (software programs) owned by canonical and docker Inc respectively to
run linux-container on hosts providing user with an easy API interface to manage them.

We can use all these tools together. Docker can run a app side-by-side a LXC container. LXC container can run a docker.
<mark>Nested containerization</mark> is possible. Running docker inside LXC

> KVM vs LXD?

+ KVM will start with a **BIOS**, then a **bootloader** that loads its **Kernel** and OS-user space, followed by loading **drivers** and **CPU-scheduling** for application processes
+ LXD are thinner and removes lot of overhead

> How to create custom LXC images? And provision them?

* External provisioners like Ansible
* LXD REST API

```sh
# cretate new project
lxc project create client-website -c features.images=false -c features.profiles=false

lxc profile show default --project default
lxc move dbserver dbserver --project client-website --target-project client2-website

```

## Questions

* Hardware assists, supported h/w

### Footnotes

[^1]: [Official Documentation](https://linuxcontainers.org/)
[^2]:
