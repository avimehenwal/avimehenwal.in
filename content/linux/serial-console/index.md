---
title      : "Serial Console"
date       : 2020-03-31T11:00:59Z
publishdate: 2020-03-31T11:00:59Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- deployment
tags:
- serial
- console
---


* [Can system boot without Video Card?](https://superuser.com/questions/454972/does-a-modern-pc-require-a-graphics-card-to-run)
  * Linux can be configured to run headless, that is, without a video console + keyboard; the console is assigned to a serial port.
  * Depends on Motherboard and BIOS
* How to identify Serial port?
  * Port 1 - in most cases[^1]
  * USB-Serial adapter to connect to modern laptop - `ttyUSB0` in most cases
    * dmesg
  * Most of the times, linux already will have serial device driver installed
* Tools to connect
  * Picocom
  * Minicon
  * SSH connection
* Methods to connect to a IoT device like RPi?
  * HDMI port with USB keyboard
  * via Networking using SSH
  * Serial Port (if device has one)- using UARTS RX and TX
    * [How to make one?](https://www.youtube.com/watch?v=ZRKBlGvsxMw)
    * Small arduino device relaying RX, TX traffic to USB port connected to computers
    * You need 2 UART interfaces
* to connect to a IoT device using serial connect all we need is
  * [ ] targe device with 1 UART interface enabled
  * [ ] Intermediate device to forward UART traffic via USB to a laptop, How to cpnfigure it
  * [ ] Laptop equipped with putty/picocom, to read forwarded UART traffic
* Proxy serial over TCP with socat
* Advantages of serial console vs normal console[^2]

## Examples

* https://www.macstadium.com/
  * enterprise-class cloud solutions for Mac and iOS app development

### Footnotes

[^1]: https://www.youtube.com/watch?v=2DyZybdXvwE
[^2]: https://www.tldp.org/HOWTO/Remote-Serial-Console-HOWTO/intro-why.html
