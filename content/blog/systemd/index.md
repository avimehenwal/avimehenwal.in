---
title      : "Systemd Init System"
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

* `init` system for linux
* System and service Manager
  * runs `PID 1`
  * Replaces `runlevels`
  * controls machine boot
  * recplaces lots of shell scripts for system boot
* Software platform for developing other apps
* Glue between user and kernel spacce applications
  * provides `dbus`
* Resources are called `Units`, it manages them in dependency graph.
* Seperate bootstrap scripts `one-shot` applications on various clous environments.

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

## Timedate control

systemd manages `timesyncd` daemon which requires linux user and group by name `systemd-timesync` to be present on system.
It synchronizes system clock across the network

timedatectl list-timezones
: set system time and zone settings
* `timedatectl status`


`/var/lib/systemd/clock`
: This file contains the timestamp of the last successful synchronization.

```
systemctl status systemd-timedated.service
bat /lib/systemd/system/systemd-timedated.service

localectl
timedatectl status
```

### Disable timwsyncd service in yocto

To disable timesyncd in your Yocto build, create a *.bbappend recipe in your own layer called

```
recipes-core/systemd/systemd_216.bbappend
And add the following content

PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd,timesyncd"

PACKAGECONFIG_remove = "timesyncd"
```

### Footnotes

[^1]: https://www.freedesktop.org/software/systemd/man/systemd.network.html