---
title      : "Penetration Distributions"
date       : 2019-08-09T21:56:30+02:00
publishdate: 2019-08-10T21:56:30+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Security
categories:
- testing
tags:
- hacking
- penetration
---

Bastion Host
ACL - access control list
<!-- more -->

- Doing something that it is not supposed to do. Act of hacking.
- Ethical when companies ask you to do so. Is in the constraints of law

## [Penetration Testing](https://en.wikipedia.org/wiki/Penetration_test)

[Computer security](https://en.wikipedia.org/wiki/Computer_security)

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
- [Firewall](({{< relref "/linux/networking/index.md" >}}))
- `Reverse Shells` infect device, which connects back to you. Sometime need to break into routers first. Fishing attacking are possible

## [Threat Model](https://en.wikipedia.org/wiki/Threat_model)

describe the reasons an attacker would have to attack the application. You will be putting their shoes on after all.
for example, is the application storing sensitive data that could be the target of a hacker, and so on.


### Pen Test Reports

* https://www.offensive-security.com/reports/sample-penetration-testing-report.pdf
* https://www.radicallyopensecurity.com/report_otf_fdroid.pdf
* https://github.com/juliocesarfort/public-pentesting-reports
* https://www.shiftleft.io/images/extended-shiftleft-web-201806-20180728-0007.pdf
* https://pulsarweb.de/Pentest_Report.pdf

### Pen test management tools

* https://github.com/salesforce/vulnreport
* 
## Groups

1. LulzSec[^1]

## Pen Testing Phases

1. Reconnaissance
   1. Social Engineering
2. Scanning
   1. [Port Scanning](https://en.wikipedia.org/wiki/Port_scanner)
      1. [Buffer Overflow](https://en.wikipedia.org/wiki/Buffer_overflow)
   2. Legal
      1. Nmap is to always secure written authorization from the target network representatives [before initiating any scanning](https://nmap.org/book/legal-issues.html)
      2. Include a written permission and Statement of Work
         1. Dates and times for scanning
         2. IP ranges to be scanned
         3. Names of systems and networks to be scanned
         4. Scanning tools to be used
         5. People conducting the scans
         6. If a remote scan is planned, include the IP address of the scanning tool
   3. Sandbox scans
      1. [Hack,Me](https://hack.me/)
3. Gaining Access
4. Maintaining Access
5. Covering Tracks



## How to anonymize yourself?

1. [tor network](https://en.wikipedia.org/wiki/Tor_(anonymity_network)), [onion routing](https://en.wikipedia.org/wiki/Onion_routing)
2. [i2p network](https://en.wikipedia.org/wiki/I2P)
   1. Invisible internet project

## Pen Testing OS

1. Parrot OS
   1. `debian` standard based, 2013
   2. Can run on RaspberryPi
   3. Extra tools
      1. `WifiPhisher`
      2. `anonsurf`
2. Kali Linux / BAcktracking
   1. `debian` standard based
3. [BlackArch Linux](https://blackarch.org/)

## Why I switched to Kali linux?

1. Was unable to install `hugo` from snap
2. `usermod` command not installed, to modify group setting and I could not find where to install it
3. Unable to run docker, installed as `docker.io` package


### Footnotes

[^1]: https://en.wikipedia.org/wiki/LulzSec
[^2]: [Picking Locks](https://www.youtube.com/watch?v=rnmcRTnTNC8)
[^3]: [CH 751 most common key](https://www.amazon.com/Southco-CH751-Campers-Cabinets-Locks/dp/B001562UII)
