---
title      : "Node MCU - ESP8266"
date       : 2019-09-13T22:20:27+02:00
publishdate: 2019-09-13T22:20:27+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Embedded
categories:
- iot
tags:
- 
---

## NodeMCU - ESP8266

* Microcontroller
* 60MHz with 64KB memory, 96KB data
* Asynchronous event-driven programming model
* Lua Flash Store (LFS) support
  * Lua is designed primarily for embedded use in applications
  * enables to create Lua applications with up to **256Kb** Lua code and read-only constants executing out of flash. All of the RAM is available for read-write data!

<!-- more -->
Firmware
: provides the low-level control for the device's specific hardware. Firmware can either provide a standardized operating environment for the device's more complex software (allowing more hardware-independence), or, for less complex devices, act as the device's complete operating system, performing all control, monitoring and data manipulation functions. Typical examples of devices containing firmware are embedded systems, consumer appliances, computers, computer peripherals, and others. Almost all electronic devices beyond the simplest contain some firmware.

PWM
: Pulse Width Modulation

RTS (Request to Send) and CTS (Clear to Send)

## Getting started

1. Flash the Image - `esptools.py`
2. `sudo apt install python-serial`
3. Image / Firmware
   1. `./esptool.py --port /dev/ttyUSB0 image_info ../nodemcu-master-15-modules-2019-09-13-20-57-17-integer.bin`
   2. `sudo ./esptool.py --port /dev/ttyUSB0 write_flash 0x00000 ../nodemcu-master-15-modules-2019-09-13-20-57-17-integer.bin`
4. [Uploading code to module](https://frightanic.com/iot/tools-ides-nodemcu/)
   1. Configure Arduino IDE `NodeMCU1.0(ESP-12E-module)`
   2. PLatrofm.io in vsCode
5. 


> Microcontroller vs Microprocessor

* Microcontroller is more specifc, Microprocessor is more general in use

> What is SERIAL port?[^1]


### Footnotes

[^1]: https://www.youtube.com/watch?v=myU2x27FIIc
[^2]:
