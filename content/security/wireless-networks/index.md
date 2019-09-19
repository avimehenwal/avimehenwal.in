---
title      : "Wireless Network"
date       : 2019-09-17T12:19:27+02:00
publishdate: 2019-09-17T12:19:27+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Security
categories:
- networks
tags:
- wifi
- wireless
- interface
- nc
---

<!-- more -->
## Network Interface

> container networking / virtual ethernet devices[^2] / bridges / iptables[^1]

* Connects computer, to a protocol stack (TCP/IP) to enable communication
  * Types
    * Ethernet
    * Token Ring
    * FDDI
    * SONET
    * wireless wi-fi
    * bluetooth networks



How to create NEW network namespace
```
sudo ip netns add ns1
```

How to run a command inside network namespace
```
sudo ip netns exec ns1 bash
```

How to add a new VLAN?

```
ip link add link eth0 name eth0.2 type vlan id 2
ip link add link eth0 name eth0.3 type vlan id 3
```


## nc

Common uses include:

* simple TCP proxies
* shell-script based HTTP clients and servers
* network daemon testing
* a SOCKS or HTTP ProxyCommand for ssh(1)

```
# TCP server listening on port 8900
nc -l 8900
```

## Modes

### Promiscuous mode

If you want to do it in `/etc/network/interfaces`, check out this configuration:

```
iface eth0 static
address 192.168.2.1
up /sbin/ifconfig eth0 promisc on
```

Bring wlan0 in monitor mode at startup
```
#/etc/network/interfaces.d/wlan0
auto wlan0
iface wlan0 inet manual
  wireless-mode monitor
```

```
iw phy phy1 interface add mon1 type monitor
iw dev wlan1 del
ifconfig mon1 up
iw dev mon1 set freq put_the frequency_here
```

## Tools

1. [Xeroxploit](https://github.com/LionSec/xerosploit)
2. [Aircrack-ng](https://en.wikipedia.org/wiki/Aircrack-ng)
3. [Metasploit_Project](https://en.wikipedia.org/wiki/Metasploit_Project)

### Footnotes

[^1]: https://jvns.ca/blog/2017/09/03/network-interfaces/
[^2]: https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/#vlan
