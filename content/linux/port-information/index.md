---
title      : "Port Information"
date       : 2019-09-10T13:42:06+02:00
publishdate: 2019-09-10T13:42:06+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- port
- curl
---

## What are PORTs?
<!-- more -->

netstat
: Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships
* This program is mostly obsolete.
* Replacement for netstat is `ss`.
* Replacement for netstat -r is `ip route`.
* Replacement for  netstat-i is `ip -s link`.
* Replacement for netstat -g is `ip maddr`.

ss
: another utility to investigate sockets.

Recv-Q and Send-Q columns
: tell us how much data is in the queue for that socket, waiting to be read (Recv-Q) or sent (Send-Q). In short: if this is 0, everything’s ok, if there are non-zero values anywhere, there may be trouble. If you look closely at the example, you’ll see that two sockets have a Recv-Q with 38 unread bytes in them. We’ll look into those connections once we know what the other columns mean.

```
# List all interfaces on computer?
cat /etc/services
grep 22 /etc/services

netstat --interfaces
ip a
ip addr show

# Routing table
netstat --route
ip route show
```


```
ss --all
ss --tcp --listening --processes
ss --unix src /tmp/.X11-unix/*
ss --tcp --processes | grep ssh

```

Show summary of each protocol statistics like `ip`, `icmp`, `tcp`, `udp`
{{% cmd %}}
netstat --statistics
ss --summary
{{% /cmd %}}

> What are local and foreign address in `netstat`?

```
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 localhost:59352         0.0.0.0:*               LISTEN
```
Local and Foreign address are linux `sockets` and state are socket states

> How to print response time with curl?

* `--write-out` format
* supress curl outptu
  * `curl --write-out '%{http_code}' --silent --output /dev/null http://example.com`

Demonstrating how SSL -D creates new SOCSKs proxy
```
watch --interval 0.2 --differences --color 'ss --tcp --processes --numeric'

for i in (seq 10)
    curl --write-out '%{time_total} United States\n' \
       --proxy socks5://127.0.0.1:9055 \
       --silent --output /dev/null \
       http://ifconfig.co/country
    sleep 1
    curl --write-out '%{time_total} Germany\n' \
       --silent --output /dev/null \
       http://ifconfig.co/country
end
```
### Footnotes

[^1]:
[^2]:
