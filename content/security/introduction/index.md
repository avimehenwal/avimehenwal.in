---
title      : "Ethical Hacking"
date       : 2019-08-09T21:56:30+02:00
publishdate: 2019-08-10T21:56:30+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Security
categories:
- pentest
tags:
- hacking
---

Bastion Host
ACL - access control list
<!-- more -->

- Doing something that it is not supposed to do. Act of hacking.
- Ethical when companies ask you to do so. Is in the constraints of law

## Penetration Testing

- Perople will pay to detect vurnabilities and even pay to fix it.
- Anonymity is the key, prefer Linux, most hacking tools are native to windows.
- People like White(within law)/ Grey/ Black(financial gail)
  - extract information from servers
  - steal credit card information
  - take services down
  - steal Authentication information
- Footprinting
  - IP of server
  - Which ports are open and guessing which services are running
  - Information gathering (either digitally or physically)
- DoS - denial of service, make more than 10,000 requests per sec and whwn apachey can't process them
  - no firewall bypass required
- `DDOS` Remote administration tools, `FUD` Fully undectitable, not detected by antivirus
- `RAT` Remote Administration Tools, malwares to make new slaves
- `Rootkit` able to hide running processes from task manager. System call to kernel, intercepts requests and manupulates it.
- `Fishing` kind of bait to promote certain actions. DNS servers gets chaines from your router and you get served by other servers, might look exactly the same and your credentials are stolen
  - Always check for `HTTPS`
- SQL Injections, some popular web frameworks are vurnable to this attacks
- VPN
- SOCKS5 Proxys, Procy chains, limited by bandwidths
- `TOR` onion routing, free to use, anonymous to a very large extent, access **Dark Web**
- VPS - Virtual Private Server, only users from certain host/ n/w could access a service
- `Keyloggers` steal information and then send email, can send existing info as well, like screenshots, turn on camera etc
- Firewall
- `Reverse Shells` infect device, which connects back to you. Sometime need to break into routers first. Fishing attacking are possible

### Footnotes

[^1]:
[^2]:
