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

## How to find out Wireless Netwworking info?

{{< code numbered="true" >}}
nmcli device status
DEVICE   TYPE      STATE        CONNECTION           
wlp5s0   wifi      connected    sinnvolle Verbindung 
docker0  bridge    connected    docker0              
enp4s0   ethernet  unavailable  --                   
lo       loopback  unmanaged    --
{{< /code >}}

1. 

### Footnotes

[^1]:
[^2]:
