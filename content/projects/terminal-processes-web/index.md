---
title      : "Terminal Processes Web"
date       : 2019-08-08T19:30:57+02:00
publishdate: 2019-08-09T19:30:57+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Project
categories:
- development
tags:
---

## How to display long running processes output in browser?

1. Transform terminal output to HTML
2. Run scripts directly from browser CGI fashsion
3. Browser <==> Unix Pipes[^3] create readable and writable streams between standard Unix Pipes and the browser to run commands
4. Can gitlabrunner with shell --executor do my job? Yeah, run it locally. Registration step might be a problem
5.
<!-- more -->

{{% warning %}}
You should never provide passwords on the command line, since command lines can be shown/stored in any number of places (examples: shell history, process listings).
{{% /warning %}}

Business Idead, making somthing then SAAS! Make a online web-version

[netcat](http://nc110.sourceforge.net/)
: Netcat is a simple Unix utility which reads and writes data across network connections, using TCP or UDP protocol.
* reads and writes data across network connections using the TCP or UDP protocol.
* Any do anything with sockets, TCP/UDP using shell-script based HTTP client and server
* netcat server `nc -l 1234`
* netcat client `nc -zv 127.0.0.1 1234`
* ANything typed either on client or server is shared
* Make simple chat application[^4]
* Netcat can also be used for port scanning. However this is not a proper use of netcat and a more applicable tool like nmap should be used.
* `nc -v -n -z -w -l localhost 75-85`

### Footnotes

[1]: [xterm.js](https://xtermjs.org/ )
[2]: [gh, goTTY](https://github.com/yudai/gotty/tree/a080c85cbc59226c94c6941ad8c395232d72d517)
[^3]: [bpipe](https://github.com/Marak/bpipe)
[^4]: [netcat use-cases](https://techtinkering.com/2013/03/25/using-netcat-to-create-ad-hoc-links-between-applications-and-machines/)
[^5]: [netcat transfer files](https://www.howtoforge.com/useful-uses-of-netcat)

