---
title      : "Linux Socket"
date       : 2019-08-09T10:55:36+02:00
publishdate: 2019-08-10T10:55:36+02:00
draft      : false
comments   : true
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

[A UNIX socket](https://en.wikipedia.org/wiki/Unix_domain_socket) is an inter-process communication mechanism that allows **bidirectional** data exchange between processes running on the same machine.

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

```bash
ss --summary
ss --tcp --all
ss --udp --all
ss --unix                    // unix domain sockets

find / -type s -print

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

## Linux Pipes

Pipes are a **unidirectional** IPC mechanism, with one end of a pipe opened for reading and the other end opened for writing.

Both the ls and more commands run without knowing they're connected through a pipe. They simply read from file descriptor 0 (standard input) and write to file descriptor 1 (standard output).

* All descriptors point to active terminal session.
* Pipes follow the mechanism of **IPC**(*inter process communication*)
* Similar to other linux concepts like, signals, queues and sockets.

### How does it happen?

* Virtual Filesystem VFS in Kernel space[^1]
* Shortcoming, can only work in parent-child
* Named PIPES are called FIFO

```bash
# blocking
mkfifo fifo
cal > fifo
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

## SoCAT

> Sockets are just doors that you open on 2 computers so they can communicate with each other over the network

* stands for **SO**cket **CAT**[^2]
* establish 2 bi-directional byte streams[^2]
  * The General Bidirectional Pipe Handler
* [Swiss Army knife for network debugging](https://medium.com/@copyconstruct/socat-29453e9fc8a6)
* What makes socat so versatile is the fact that an **address** can represent a
  * **EXEC**/**SYSTEM** - fork a subprocess using
  * **GOPEN** read from a file on filesystem
  * **PIPE** - generate a pipe if not already exists
  * **PTY** - generates a pseudo terminal and uses its master side
  * `network socket`
  * `file descriptor`
  * `a Unix domain datagram or stream socket`
  * `TCP`
  * `UDP` (over both IPv4 and IPv6)
  * `SOCKS` 4/4a over IPv4/IPv6
  * SCTP
  * datagram and stream sockets
  * named and `unnamed pipes`
  * raw IP sockets
  * `OpenSSL`
  * on Linux even any arbitrary `network device`.
* TCP4, CREATE, EXEC, GOPEN, STDIN, STDOUT, PIPE, PTY, UDP4 etc
* *Netcat* is a fantastic tool for network debugging and exploration, but it’s mostly limited to TCP and UDP connections. socat, in comparison, supports a very wide variety of address types.


{{% cmd %}}
socat [options] <source> <sink>
{{% /cmd %}}


{{< code numbered="true">}}
socat -d -d [[[-]]] [[[TCP4:www.example.com:80]]] \
TCP4-LISTEN:www.example.com:80,[[[fork]]]

socat -d -d \
  READLINE\!\!OPEN:file.txt,creat,trunc \
  SYSTEM:'read stdin; echo $stdin'

socat UDP4-RECVFROM:161,fork \
  UDP4-SENDTO:localhost:10161

// socket closes after 1st connection
socat -u \
   GOPEN:$HOME/README.adoc \
   TCP-LISTEN:5778,reuseaddr

socat -u \
   TCP:localhost:5778 \
   STDOUT > /path/to/download/file

socat tcp-listen:8000,reuseaddr,fork \
   file:/dev/ttyUSB0,nonblock,waitlock=/var/run/tty0.lock,b115200,raw,echo=0

socat -d -d \
  pty,raw,echo=0 \
  pty,raw,echo=0
{{< /code >}}

1. Source, **alias** for STDIO
2. Sink, check man page for all aliases
3. Options: retries, timeouts etc

### Use cases

1. [Use SOCAT for port forwarding](https://stackoverflow.com/questions/34791674/socat-port-forwarding-for-https)
   1. `socat TCP-LISTEN:8080,reuseaddr,fork TCP:localhost:1313`
   2. forward TCP 8080 requests to hugo server running at port 1313
   3. Tested in browser, works great
   4. [Clearing up sockets takes sometime](https://stackoverflow.com/questions/5106674/error-address-already-in-use-while-binding-socket-with-address-but-the-port-num)
      1. we are closing the connection, but not clearing the socket
      2. socket probably enter in TIME_WAIT state
2. [Socat mailserver](https://github.com/craSH/socat/blob/master/EXAMPLES)
3. [Share files on the local network with socat](https://knplabs.com/en/blog/share-files-on-the-local-network-with-socat)
4. [Forward raspberry Pi serial connection](http://www.anites.com/2017/11/socat.html)
   1. Assumes that socat is installed and already running on target in listening mode
   2. On development machine, forward local ttyUSB connection to remote serial port
5. Logfile of time, each time you execute it
   1. `date | socat - GOPEN:/tmp/capture,append`




### Footnotes

[^1]: [yt, Pipes FS](https://youtu.be/2pTLehAj9fA)
[^2]: [Stackoverflow - questions    tagged socat](https://stackoverflow.com/questions/tagged/socat)
