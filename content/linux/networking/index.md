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

tl;dr
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

### Footnotes

[^1]:
[^2]:
