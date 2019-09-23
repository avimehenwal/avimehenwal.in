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

* Packet sniffing
  * sends all n/w packets to CPU
If you want to do it in `/etc/network/interfaces`, check out this configuration:

```
iface eth0 static
address 192.168.2.1
up /sbin/ifconfig eth0 promisc on

# PRomiscous mode
ip link set dev wlp5s0 promisc on/off
# interface up/down
ip link set wlp5s0 down/up
# multicaste
# assign ip
ip addr add/del 10.73.31.123 dev wlp5s0
# routing table
ip route show
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

## Aircracck-ng

Aircrack-ng is a complete suite of tools to assess WiFi network security.

It focuses on different areas of WiFi security:

Monitoring: Packet capture and export of data to text files for further processing by third party tools
Attacking: Replay attacks, deauthentication, fake access points and others via packet injection
Testing: Checking WiFi cards and driver capabilities (capture and injection)
Cracking: WEP and WPA PSK (WPA 1 and 2)

1. determine your [wireless chipset](https://wikidevi.com/wiki/Wireless_adapters/Chipset_table)
   1. `lspic`
   2. `lspci -vv -s 05:00.0
   3. Ralink, Atheros, Qualcomm`
2. Decide, you want to use tool only to listen to traffic or inject packets as well
3. Wireless card has a chipset
4. [Tutorials](https://aircrack-ng.org/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/doku.php?id=tutorial)
5. [Patches](https://patches.aircrack-ng.org/)
6. `rfkill list`
   1. Tool for enabling and disabling wireless devices
   
Open System Authentication:

Ask the AP for authentication.
The AP answers: OK, you are authenticated.`
Ask the AP for association
The AP answers: OK, you are now connected.

This is the simplest case, BUT there could be some problems if you are not legitimate to connect:

WPA/WPA2 is in use, you need EAPOL authentication. The AP will deny you at step 2.
Access Point has a list of allowed clients (MAC addresses), and it lets no one else connect. This is called MAC filtering.
Access Point uses Shared Key Authentication, you need to supply the correct WEP key to be able to connect. (See the How to do shared key fake authentication? tutorial for advanced techniques.)




## Tools

1. [Xeroxploit](https://github.com/LionSec/xerosploit)
2. [Aircrack-ng](https://en.wikipedia.org/wiki/Aircrack-ng)
3. [Metasploit_Project](https://en.wikipedia.org/wiki/Metasploit_Project)
4. Airsnort

### Footnotes

[^1]: https://jvns.ca/blog/2017/09/03/network-interfaces/
[^2]: https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/#vlan
