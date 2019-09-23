---
title      : "Networking"
date       : 2019-09-14T16:35:23+02:00
publishdate: 2019-09-14T16:35:23+02:00
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

### Footnotes

[^1]: https://en.wikipedia.org/wiki/Netfilter
[^2]:
