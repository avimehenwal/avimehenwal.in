---
title      : "02 August Friday"
date       : 2019-08-02T11:51:02+02:00
publishdate: 2019-08-03T11:51:02+02:00
comments: false
revision: 0
weight: 5
series:
- DailyLogs
categories:
- embedded
- linux
tags:
- systemd
---

## How to configure network using systemd?

`systemd` uses [`networkd`](https://en.wikipedia.org/wiki/Systemd#networkd) to configure netwrok interfaces.

Configuration file path `/etc/systemd/network/dhcp.network`

```
[Match]
Name=en*

[Network]
Address=192.168.0.15/24
Gateway=192.168.0.1
# OR
DHCP=yes
```

notify-send
: send alerts from terminal commands/scripts

timedatectl list-timezones
: set system time and zone settings
* `timedatectl status`


### Footnotes

[^1]: https://www.freedesktop.org/software/systemd/man/systemd.network.html
[^2]:
