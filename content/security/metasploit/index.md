---
title      : "Metasploit"
date       : 2019-09-25T12:04:25Z
publishdate: 2019-09-25T12:04:25Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Security
categories:
- exploit
tags:
- metasploit
---

## Metasploit

* a tool for developing and executing exploit code against a remote target machine
* The Metasploit Project includes anti-forensic[^1] and evasion tools
* Source code[^3]
* https://www.sans.org/security-resources/sec560/misc_tools_sheet_v1.pdf

<!-- more -->

IDS - Intrusion Detection System
: Monitors a network or a stystem for vurnabilities or malicious activities
* `snort`, `suricata`

```
[ metasploit v5.0.46-dev                          ]
[ 1921 exploits - 1075 auxiliary - 330 post       ]
[ 556 payloads - 45 encoders - 10 nops            ]
[ 4 evasion                                       ]
```

```
info explot/windows/smb/psexec
use explot/windows/smb/psexec
show options
set PAYLOAD windows/meterpreter/reverse_https
set LPORT 443
exploit -h
explott -j
run           # to run auxillary scans
sessions
session -i 1  # run any ruby code in context
load          # loads plugins from metasploit

# Searching exploits
search
use
options
set verbose true

```

use auxiliary/scanner/ssh/ssh_version
use auxiliary/scanner/http/docker_version

use auxiliary/scanner/x11/open_x11
nmap -p 6000 --script=x11-access 192.168.121.220/24

Find out SSH version you are runnugn

```
apt show ssh
ssh -v localhost
ssh -V
```

## Exploits and Scans

* Reverse Shells
  * https://github.com/rapid7/metasploit-framework/wiki/How-to-use-a-reverse-shell-in-Metasploit
* [FTP Sniffing](https://www.offensive-security.com/metasploit-unleashed/password-sniffing/)
* Linux Provilage Escalation[^5]

## Burp Suite

* interception proxy tool
* website Scanning
* Documentation[^4]
* setup local `http://localhost:8888/dvwa/login.php`
* Setup the Porxy
* Intruders
  * Dictionary[^8] and brute force attacks[^7]
* Repeater
  * sending same request with multiple params
* Decoder - crypto
  * SHA, MD5, base64
  * Smart decode, to decode passwords

Intercepting requests on localhost

```
about:config
Type the following into Firefox address bar 'about:config'
Type the following settings 'network.security.ports.banned.override'
Enter your port number '6666'

http://burp/
```

* https://support.portswigger.net/customer/portal/articles/2956765-installing-burp-s-ca-certificate-in-chrome-on-linux
* https://support.portswigger.net/customer/portal/articles/1783087-installing-burp-s-ca-certificate-in-firefox
* https://medium.com/cyberdefenders/burp-suite-webpage-enumeration-and-vulnerability-testing-cfd0b140570d
* https://support.portswigger.net/customer/portal/articles/2326039-the-burp-methodology-
*



### Footnotes

[^1]: https://en.wikipedia.org/wiki/Computer_forensics
[^2]: https://en.wikipedia.org/wiki/Shellcode
[^3]: https://github.com/rapid7/metasploit-framework
[^4]: https://portswigger.net/burp/documentation/desktop/scanning
[^5]: http://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/
[^6]: https://github.com/jlevy/the-art-of-command-line
[^7]: https://github.com/danielmiessler/SecLists
[^8]: https://www.kaggle.com/wjburns/common-password-list-rockyoutxt