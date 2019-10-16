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
- dbus
---

D-BUS
: [Desktop Bus](https://en.wikipedia.org/wiki/D-Bus)
* S/w bus for communication b/w processes using IPC and RPC
* D-bus wire protocol allows connection b/w various processes using **unix domain sockets**
* `:1.1557` unique process address

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
  * [provides `dbus`](https://en.wikipedia.org/wiki/D-Bus)
* Resources are called `Units`, it manages them in dependency graph.
* Seperate bootstrap scripts `one-shot` applications on various cloud environments.

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

## Systemd vs Supervisord

Let’s say I have a Django application named Foo. I want to be sure Foo is running all the time, even if it crashes. Also, I want a simple interface to start, stop and restart its process. Supervisord is a perfect match for this job.

* Process Monitoring
* systemd has not, like controlling services with a web interface
* Project Cockpit[^2] interactive server admin interface


> Cockpit uses systemd and the DBus APIs it provides to configure and monitor core aspects of the system.

{{< code numbered="true" >}}
[Unit]
Description="Foo web application"
After=network.target

[Service]
User=foo
Group=foo
Environment=LANG=en_US.UTF-8,LC_ALL=en_US.UTF-8
ExecStart=/home/foo/bin/start_foo

[Install]
WantedBy=multi-user.target
{{< /code >}}

> LC_ALL: cannot change locale

```
sudo locale-check
sudo locale-gen en_US
sudo update-locale LANG=en_US
```

### Footnotes

[^1]: https://www.freedesktop.org/software/systemd/man/systemd.network.html
[^2]: [Project cockpit](https://cockpit-project.org/)