---
title      : "Networking"
date       : 2019-09-14T16:35:23+02:00
publishdate: 2019-09-14T16:35:23+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Linux
categories:
- embedded
- os
tags:
- nmcli
- network-manager
- network
---

netfilter[^1]
: Netfilter is a framework provided by the Linux kernel that allows various networking-related operations to be implemented in the form of customized handlers. Netfilter offers various functions and operations for packet filtering, network address translation, and port translation, which provide the functionality required for directing packets through a network and prohibiting packets from reaching sensitive locations within a network.
<!-- more -->

## How to find out Wireless Networking info?

{{< code numbered="true" >}}
$ [[[nmcli]]] device status
DEVICE   TYPE      STATE        CONNECTION
wlp5s0   wifi      connected    sinnvolle Verbindung
docker0  bridge    connected    docker0
enp4s0   ethernet  unavailable  --
lo       loopback  unmanaged    --

> nmcli [[[radio]]] all
WIFI-HW  WIFI     WWAN-HW  WWAN
enabled  enabled  enabled  enabled

> nmcli [[[device wifi list]]]
> nmcli device wifi connect <SSID> password <PASSWORD>
> [[[networkctl]]] list
{{< /code >}}

1. command-line tool for controlling NetworkManager
2. Show radio switches status
3. List all visible wifi SSID with signal strength, and bars
4. COnneccting to wifi using cli
5. Manage network

## Who are connect to my wifi?

[xerosploit](https://github.com/LionSec/xerosploit)
: Effcient and advanced man in the middle framework
* Inject HTML
* Inject javascript
* DoS attack

```
> sudo xerosploit
> scan
```

## Opensource Firewalls

Very important when exposed to external world

iptables
: baked into linux

ufw
: uncomplicated firewall

```
ufw --dry-run status verbose
ufw --dry-run enable/disable
ufw --dry-run reset
ufw show raw

ufw --dry-run default deny incoming
ufw --dry-run default allow outgoing

ufw --dry-run allow/deny ssh/22/tcp/udp

ufw --dry-run allow from 192.168.1.1                    # default gateway
ufw --dry-run allow from 192.168.1.1 to any port 22
ufw --dry-run allow from 192.168.1.1/24
ufw --dry-run status numbered

ufw --dry-run delete 1/deny 80/tcp
ufw logging on/off
```

## Types

* Instant virtual network with mininet[^2]
## Bridges

> Used a lot with virtualization


* Divide LAN into multiple segments
* works under Data link layer
  * works with `MAC` address of device
* Any request is first sent to bridge, then bridge decides which segment to broadcast the data to

* Home router IPs are always `192.168.*.*`
* ISP provided IP address `24.*.*.*`

```
brctl
networkctl list
networkctl status
```

## Troubleshooting Network

* Analysize communication using `tcpdump`
  * `-A` - print in ASCII

### How do I add eth2 to my linux machine?

On Linux machines, eth0 and eth1 correspond to real network ports. To add an eth2, you'll need to add another NIC, either by adding an internal PCI(e) network card, or by adding a USB network adapter.

* [How do I create virtual ethernet devices in linux?](https://stackoverflow.com/questions/2082722/how-do-i-create-virtual-ethernet-devices-in-linux)
* [TUN and TAP virtual network interfaces](https://en.wikipedia.org/wiki/TUN/TAP)

## Networking tasks

1. check interface status and IP
2. Release and renew IP from DHCP server
3. `eth0` is the first netwrok card in system
4. Internet routung is self-healing. Whst if we nuke a router?
5. VPN - uses **Tunneling Protocol**, encryption
   1. Tunnel can recreate itself in case of `Man-in-the-middle-attack`
6. interface `eth0.1` is a virtual interface with **VLAN ID 1** having eth0 as its parent interface.
7. A Linux bridge behaves like a network switch. It forwards packets between interfaces that are connected to it. It’s usually used for forwarding packets on routers, on gateways, or between VMs and network namespaces on a host. It also supports STP, VLAN filter, and multicast snooping.
8. DHCP 4 step protocol stages
   1. DHCPDISCOVER
   2. DHCPOFFER
   3. DHCPREQUEST
   4. DHCPACK
9.

```
# Release and renew DHCP client
dhclient
/etc/init.d/networking
```

### Footnotes

[^1]: https://en.wikipedia.org/wiki/Netfilter
[^2]: http://mininet.org/
[^3]: https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/
