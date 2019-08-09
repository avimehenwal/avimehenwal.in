---
title      : "Linux Socket"
date       : 2019-08-09T10:55:36+02:00
publishdate: 2019-08-10T10:55:36+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- socket
- pipe
---

## What is socket?

[A UNIX socket](https://en.wikipedia.org/wiki/Unix_domain_socket) is an inter-process communication mechanism that allows bidirectional data exchange between processes running on the same machine.

IP sockets (especially TCP/IP sockets) are a mechanism allowing communication between processes over the network. In some cases, you can use TCP/IP sockets to talk with processes running on the same computer (by using the loopback interface).

* A Unix/Linux socket file is basically a **two-way FIFO**
* Socket is a special kind of file in linux like everything else.
* Connecting 2 processes to communicate
* Provides connectivity without the need of network through a socket file
* There are display server `X11` unix socket `/tmp/.X11-unix/X0`
* other examples are samba socketc, docker, libvirt, snapd, udev, systemd.journal
* Follows a **client-server** model
* [Read more about socket on github](https://github.com/avimehenwal/python.avimehenwal/blob/b7a55b5a30a353559d3a9cc59ea1c8d64d0b38bc/PortScanner/README.md)
<!-- more -->

There is no commmand line tool to create sockets since a socket is always connect to a server which handles the requests sent to that socket.


{{% warning %}}
 UNIX domain sockets are subject to file system permissions, while TCP sockets are not
{{% /warning %}}

### How to find sockets and list them?

[ss](https://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html)
: socket statistics command

```
ss --summary
ss --tcp --all
ss --udp --all

find / -type s -print

netstat -xl
#  Active UNIX domain sockets (only servers)
```

## Usecases - Examples

1. [Check if IPv6 is enabled on machine or not](https://github.com/avimehenwal/python.avimehenwal/blob/b7a55b5a30a353559d3a9cc59ea1c8d64d0b38bc/IPv6/IPv6_checker.py)
2. [Port scanner](https://github.com/avimehenwal/python.avimehenwal/blob/master/PortScanner/PortScanner.py)


## Types of Files in Linux

Plain File
: Or regular file which contains data in ASCII, binary or other encoded formats

Named sockets vs normal/un-named sockets

## Why bother about sockets?

- Inter-process communication
- Network communication
- Peer to peer network

**Analogy**: Call on Telephone network

## Linnux Pipes

Pipes are a unidirectional IPC mechanism, with one end of a pipe opened for reading and the other end opened for writing.

Both the ls and more commands run without knowing they're connected through a pipe. They simply read from file descriptor 0 (standard input) and write to file descriptor 1 (standard output).

* All descriptors point to active terminal session.
* Pipes follow the mechanism of **IPC**(*inter provecc communication*)
* Similar to other linux concepts like, signals, queues and sockets.

### How does it happen?

* Virtual Filesystem VFS in Kernel space[^1]
* Shortcoming, can only work in parent-child
* Named PIPES are called FIFO

```
# blocking
mkfifo fifo
cal > fifo
```


```sh
ls | less
```

## Python implementation

* `socket` inbuilt module along with [`socketserver - A framework for network servers`](https://docs.python.org/3/library/socketserver.html#module-socketserver)
* SERVER : `bind`, `connect`, `close`
* CLIENT : `send`, `recieve`
* Fixed header-size
* Decide how to choose read/write buffer size!
* Send `bytes`, `raw`
* Use `pickle` to seriase data before sending data over socket

> [Link to github project](https://github.com/avimehenwal/python.avimehenwal/tree/master/SockerProgramming)

### Footnotes

[^1]: [yt, Pipes FS](https://youtu.be/2pTLehAj9fA)
[^2]:
