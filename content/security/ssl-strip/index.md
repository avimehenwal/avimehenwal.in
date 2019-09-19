---
title      : "SSL Strip Attack"
date       : 2019-09-19T19:07:54Z
publishdate: 2019-09-19T19:07:54Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Security
categories:
- development
tags:
- ssl
---

* convert `https` to `http`
<!-- more -->

## Opensource Firewalls

Very important when exposed to external world

iptables
: baked into linux

ufw
: uncomplicated firewall

```
ufw enable/disable
ufw reset
ufw default deny incoming
ufw default allow outgoing
ufw allow/deny ssh/22
ufw allow from 192.168.1.1   # default gateway
ufw allow from 192.168.1.1 to any port 22
ufw allow from 192.168.1.1/24
ufw status numbered
ufw delete 1
```

### Footnotes

[^1]:
[^2]:
