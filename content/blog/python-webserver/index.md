---
title      : "Python Webservers"
date       : 2019-07-31T18:15:25+02:00
publishdate: 2019-08-01T18:15:25+02:00
comments   : false
weight     : 5
revision   : 0
series:
- Programming
categories:
- python
- serverside
tags:
- webserver
- http
---

A browser is an **HTTP client** because it sends requests to an **HTTP server** (Web server),
which then sends responses back to the client. The standard (and default) port for HTTP
servers to listen on is **80**, though they can use any port.

* Apache creates *processes* and *threads* to handle additional connections. While Nginx is said to be event-driven, asynchronous, and non-blocking.
* Nginx includes advanced **load balancing** and **caching abilities**.
* Nginx is a lot lighter than Apache

+ Python webframeworks provide simple to use `Request-Response` structure for HTTP calls
+ search the codebase `grep -i wsgi`

WSGI - Web Server Gateway Interface
: standardise interface b/w webserver and python applications/frameworks
* [PEP 333(3)](https://www.python.org/dev/peps/pep-3333/)
* Makes it easy to switch webserver like `nginx` or `apache` is they speak the WSGI language

### CGI - Common Gateway Interface

* **Static webserver** serves boring static HTML files.
  * Session Management not possible
  * No dynamic views
* Invoke a `SCRIPT` instead of a `FILE`. Scripts are saved on server. UNIX like philosohpy, request inputs are set in `environment variables`. Can use `stdout` as output
* `gunicorn` talks `WSGI` language and feeds the framework with requests and responses paameters

### Making a python web-server from scratch

Use python `sockets`

```
Client Request ----> Nginx (Reverse-Proxy)
                        |
                       /|\
                      | | `-> App. Server I.   127.0.0.1:8081
                      |  `--> App. Server II.  127.0.0.1:8082
                       `----> App. Server III. 127.0.0.1:8083
```

### Footnotes

[^1]:
[^2]:
