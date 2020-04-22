---
title      : "Proxy Server"
date       : 2020-03-02T09:40:12Z
publishdate: 2020-03-02T09:40:12Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Security
- Test
- DailyLogs
categories:
- network
tags:
- proxy
- squid
---

A proxy is fundamentally an intermediate that allows you to access information over the internet

<!-- more -->

```sh
sudo systemctl restart squid
/etc/squid/squid.conf

docker container diff 1cf9671bcb28 | less
apt info squid
apt info squid3
```

{{% note %}}
A VPN doesn’t make you anonymous!
{{% /note %}}

## Types of proxies

* HTTP Proxy
  * only handle the web applications
  * extra layer of security
  * A load balancer is a good example of a web proxy.
  * Squid
  * Elite proxies
  * Anonymous proxies
  * Transparent proxies
* SOCKS Proxy
  * general-purpose proxy server
  * it is able to cater to any network protocol (not just the HTTP) making it a very versatile and efficient server to be used
  * SOCKS5
  * All your traffic is encrypted
  * All of SOCKS Proxies are Elite proxies, the web server only get the information of proxy server.That’s why SOCKS 5 proxy is more Recommend.
  *

{{< code numbered="true" >}}
curl [[[--proxy]]] http://<squid-proxy-server-IP>:3128 [[[--location]]] http://google.com
{{< /code >}}

1. Send requests to proxy first
2. Allow redirects, if the location of server is changed

## Use cases

* Block websites like facebook using ACL
* Cache common replies
* Web authenticaation services
* Allow and deny `http_access` to ip, subnets
* Internet_Cache_Protocol[^1]

## Test Experiment

* In container install `curl`, `squid`, `htop`, `traceroute/bionic`, `ping`, `vim`
* [experiments](https://gitlab.com/avimehenwal/experiments)

### Footnotes

* [Squid configuration examples](https://wiki.squid-cache.org/ConfigExamples)
* [Squid directive list](http://www.squid-cache.org/Doc/config/)

[^1]: https://en.wikipedia.org/wiki/Internet_Cache_Protocol
[^2]:
