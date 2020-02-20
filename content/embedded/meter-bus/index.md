---
title      : "Meter Bus"
date       : 2020-02-20T12:07:21Z
publishdate: 2020-02-20T12:07:21Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Embedded
categories:
- design
tags:
- mbus
- bus
---


# M-Bus

* European standard for the remote reading of water meter, gas or electricity meters.
* uses 2 wires for communication
* Wireless M-bus (circular link) veriant is also available
* An alternative method of collecting data centrally is to transmit meter readings via a modem.
  * modulator-demodulator
  * is a hardware device that converts data into a format suitable for a transmission medium so that it can be transmitted from one computer to another (historically along telephone wires)
* Other applications for the M-Bus such as alarm systems, flexible illumination installations, heating control, etc. are suitable.
* Since the M-Bus is not a network, and therefore does not - among other things - need a transport or session layer, the levels four to six of the OSI model are empty[^2].
* Only the physical, the data link, the network and the application layer are provided with functions[^2].

{{% note %}}
MBus is a chip-to-chip bus designed for ultra-constrained systems
{{% /note %}}

## How to include mbus with linux kernel?



### Footnotes

[^1]: [Wireless m-bus module with RF solution](https://wireless-solutions.de/products/radiomodules/im871amodule/html)
[^2]: [Meter bus](https://en.wikipedia.org/wiki/Meter-Bus)
[^3]: [m-bus .io](http://mbus.io/)
