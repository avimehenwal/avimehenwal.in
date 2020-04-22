---
title      : "Clock Synchronization"
date       : 2020-01-21T09:54:43Z
publishdate: 2020-01-21T09:54:43Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Linux
- DailyLogs
categories:
- design
tags:
- clock
- ntp

---

- [ ] Why clock is important in computer system? Synchronous circuits[^2]
- [ ] fully **asynchronous computer** built by Jacek Karpiński which was named KAR-65

## Clock Synchronization

* coordinate otherwise independent clocks
* clock drift can result in clock skew
* it is impossible to synchronize the clocks perfectly

## Problems

- expecially in distributed environment
- in Unix systems the `make command` is used to compile new or modified code and seeks to avoid recompiling unchanged code. The make command uses the clock of the machine it runs on to determine which source files need to be recompiled. If the sources reside on a separate file server and the two machines have unsynchronized clocks, the make program might not produce the correct results
- Streaming media
- Audio over Ethernet

## Solutions

$$
(Epoch Timestamp)_{64 bits} = 32(seconds) + 32(fraction second)
$$

* Epoch time 1990
* Clock roll over period 2036
* Round trip delay
* Absolute time difference between clocks

### Central server environment

Potential solutions to the clock synchronization problem in this environment

* Cristian's algorithm
* the Berkeley algorithm

### Distributed Environment setting

* Global time is not known
* NTP - Network time protocol
  * Layered client -server architecture
  * basded on UDP protocol

### In a wireless network

the problem becomes even more challenging due to the possibility of collision of the synchronization packets on the wireless medium and the higher drift rate of clocks on the low-cost wireless devices.[4][5]

## NTP - Network Time Protocol

* networking protocol for clock synchronization
* It uses the intersection algorithm, a modified version of Marzullo's algorithm, to select accurate time servers and is designed to mitigate the effects of variable network latency
* Software implementation - `chrony`

## Chrony

* NTP implementation


## Security

* NTP Protocols may be susceptible to man-in-the-middle attacks
* used in Distributed DoS attack[^5]

### Footnotes

[^1]: https://en.wikipedia.org/wiki/Clock_synchronization
[^2]: https://en.wikipedia.org/wiki/Synchronous_circuit
[^3]: https://electronics.stackexchange.com/questions/93875/why-are-clocks-used-in-computers
[^4]: https://electronics.stackexchange.com/questions/33945/clock-signals-in-computers-and-machines
[^5]: https://sei.cmu.edu/about/divisions/cert/index.cfm#cert-division-what-we-do
[^6]:
