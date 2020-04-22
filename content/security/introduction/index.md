---
title      : "Penetration Distributions"
date       : 2019-08-09T21:56:30+02:00
publishdate: 2019-08-10T21:56:30+02:00
draft      : false
comments   : true
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

## Impact

* Most FTSI The Financial Times Stock Exchange 100 Index are affected by data/information leaks
* All fortune 100 companies are equally affected no matter how big you are
* Demo - script that tries to login to 20 different websites
  * Password reuse style attacks
    * How to mitigate
      * Use Password Managers
        * https://www.lastpass.com/
        * https://www.dashlane.com/
        * Enable 2-factor Authentication
        * Dummy Email ID for sites you do not trust
          * Burner accounts
* Way to delivery Virus models
  * Way to find ways runs codes on computers
    * emails, videos
    * send and email with attachment, they click and open it. because thats what you do with attachments
    * executables on video players, files
    * you can block an many delivery vectors as you can, but its the payload that counts
* IT infrastructure is strong but `Telecom Infra`is still weak
* tools to [search github for username/pass](https://github.com/UnkL4b/GitMiner)
* these days we have
  * Ransomeware As A Service
  * DDoS for hire
  * IoT based Botnets
  * Commodity Cybercrime tools
* Industrial Control System - dont connect them to internet - Airgap
* Pen Testing is QA shop
  * Finding bugs to sell
  * Bug database
  * internal insights on how fequently a bug appears
  * and how long does it takes companies to solve it
  * ML to generate passwords
  * On sight in datacentre time - **Util time**
* Password encryption standards - definately not `base16` its 2019
* `Grammer` is important - `Fuzzying` - fucking with input
  * If you know the grammer, you can emit/mutate input language
  * https://github.com/MozillaSecurity/dharma
* https://zerodium.com/
* States Matters in softwares
  * they have protocols to follow
  * logedin state, logged out state, admin role etc
  * Stateful Fuzzying
* https://en.wikipedia.org/wiki/Symbolic_execution
  * analyzing a program to determine what inputs cause each part of a program to execute
  * You define the goal state and let execution take care of rest
  * like find a solution to a puzzle
* https://en.wikipedia.org/wiki/Program_synthesis
  * let magic and sciencce do the hard work.
  * Monte carlo tree search
  *
* Stop `C` use `rust` its `memory-safe`, `type-safe`, can do stuff which java .net cannot do
* Embrace Automation
* SHODAN (Sentient Hyper-Optimized Data Access Network)
* [Heartbleed damage report](https://www.shodan.io/report/0Wew7Zq7)

> We need to up our game

## Hackers

1. LulzSec[^1]
2. https://en.wikipedia.org/wiki/WannaCry_ransomware_attack
   1. MS-17-010
   2. Hybrid Encryption scheme
   3. Files encrypted by `AES` and that key is protected by public key cryptography
3. https://www.makeuseof.com/tag/5-of-the-worlds-most-famous-hackers-what-happened-to-them/
4.

### Footnotes

[^1]: https://en.wikipedia.org/wiki/LulzSec
[^2]: [Picking Locks](https://www.youtube.com/watch?v=rnmcRTnTNC8)
[^3]: [CH 751 most common key](https://www.amazon.com/Southco-CH751-Campers-Cabinets-Locks/dp/B001562UII)
[^4]: https://en.wikipedia.org/wiki/Equation_Group
[^5]: https://en.wikipedia.org/wiki/Lazarus_Group
[^6]: https://www.shodan.io/
[^7]: https://en.wikipedia.org/wiki/BlackEnergy
[^8]: https://en.wikipedia.org/wiki/Cyber_insurance
[^9]: https://www.binaryedge.io/
[^10]: https://censys.io/
[^11]: https://github.com/knownsec/ZoomEye
[^12]: http://langsec.org/
[^13]: https://en.wikipedia.org/wiki/Weird_machine
[^14]: https://en.wikipedia.org/wiki/Cargo_cult
[^15]: https://www.binaryedge.io/
[^16]: https://nvd.nist.gov/
[^17]: https://blog.osvdb.org/
[^18]: https://www.nist.gov/