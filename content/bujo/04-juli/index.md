---
categories: []
date: "2019-07-04T09:45:15+02:00"
revision: 0
series:
- DailyLogs
slug: ""
tags: []
title: 04 Juli
---

tl;dr
<!-- more -->

LVDS
:  Low Voltage Differential Signaling

Differential Signaling
: The technique sends the same electrical signal as a differential
pair of signals, each in its own conductor.
The receiving circuit responds to the electrical difference between
the two signals, rather than the difference between a single wire and ground

transceiver
: a device that can both transmit and receive communications, in particular a combined radio transmitter and receiver.

Polarity
: signal’s position or voltage above or below the median line

Phase
:  Phase is delay and results in the offsetting of a signal in time.
It follows that a 180° phase shift is a half-rotation or half-wavelength and a 360° phase shift is a whole rotation or full wavelength.

CS
: [chip select](https://en.wikipedia.org/wiki/Chip_select)
For arduino its not restricted to `D10`, we can configure any pin on board as salve select line or chip select.

Bitrate
: In digital telecommunication, the bit rate is the number of bits that pass a given point in a telecommunication network in a given amount of time, usually a second. Kbps

```
BR = D / T

Where:
    BR = Bit Rate
    D = Amount of Data
    T = Time (usually seconds)

```


## SPI

SPI Mode |	CPOL   | CPHA	| Clock Polarity in Idle State | Clock Phase Used to Sample and/or Shift the Data
----------|--------|--------|------------------------------|-----------------------------------------------------------
0	      | 0	   | 0	    | Logic low	                   | Data sampled on the rising edge and shifted out on the falling edge
1	      | 0	   | 1	    | Logic low	                   | Data sampled on the falling edge and shifted out on the rising edge
2	      | 1	   | 1	    | Logic high	               | Data sampled on the falling edge and shifted out on the rising edge
3	      | 1	   | 0	    | Logic high	               | Data sampled on the rising edge and shifted out on the falling edge

- Device talk to persistent storage in the form of an EEPROM over the Serial Peripheral Interface Bus (SPI) on the BeagleBone Black.
  SPI signals over longer distance on the
  same PCB or off PCB to another board in a noisy
  environment by transmitting SPI signals over LVDS
  interface
  - LVDS devices offer more noise immunity
  - could be implemented as board to board application or single board application
- At least 3 meter communication range using SPI
  over LVDS vs. 0.5 meter range using standard SPI
- As distance increases, external noise and crosstalk between SPI
  signals becomes an issue
- The SPI allows data to move in both directions from a bus master (controller) to various chips which are attached to the bus
- Application
  - ADCs, DACs, shift registers, SRAM
-  SPI devices support much higher clock frequencies compared to I2C interfaces.
-  select the slave by enabling the CS signal. Usually chip select is an active low signal.
-  One chip select CS line for each slave device. Could not use for as many as with i2c due to this limitation
-  High speed like writing to SD card


• Semiconductor Test Equipment
• Data Acquisition
• Lab Instrumentation
• Ultrasound Scanner
• CT Scanner
• Protection Relay
• Terminal Unit

## CAN

- the transmission rate is specified in Bits/Sec not Hz.
- developed by Bosch starting in 1983
- Multi master network
- Bit rate upto 1 Mbits/sec
- Network length upto 5Km
- serial communication protocol
- 

CAN Frames

```
# hoe to set can bitrate
ip link set can0 type can bitrate 12500
```

## GPIO -  General Purpose Input Output

* They are General Purpose Input Output and are pins on various processors that aren’t dedicated to anything.

As a recap, each gpio pin on the BBB has three different numbering schemes associated with it!

The physical pin location, in the form of PX_Y (P8_28)
The gpio name, in the form of GPIOX_Y (GPIO2_24)
The gpio number, in the form of 32*X + Y (88)
Only the last scheme, the gpio number, is used in software!

GPIO expanders for GPIO pins to connect multiple i2c devices when the number of available on board pins are less

stty
: set tty

```
stty istrip
stty -a | grep -i istrip
stty -istrip
stty -a | grep -i istrip
```

## Migrate from hugo --> gatsby
chance to learn react
[NEtlifyCMS](https://www.netlifycms.org/docs/start-with-a-template/)
[tailwindcss - css framework](https://tailwindcss.com/)
The plan

## Questions
How to create and add mindmaps to html blogs?
    svg export from freeplanes is not good enough for dense and large MM
https://www.w3schools.com/howto/howto_css_timeline.asp

SVG
: XML based vector image format, open standard by W3C.
* Lets you write images using code

### Gatsby test drive

Babel
: Babel is a JavaScript compiler
Babel is a toolchain that is mainly used to convert ECMAScript 2015+ code into a backwards compatible version of JavaScript in current and older browsers or environments. Here are the main things Babel can do for you: Transform syntax.

+ npm install too many modules, I dont know how many. Takes a while for the first time
+ SPA - server sends all logic code to frontend, bare bones and all rendering happens at client side. like in react.

SSR
: server side rendering

writing html inside js files
partials ~ react components



### Footnotes

[^1]: [SPI architecture user guide, TI](http://www.ti.com/lit/ug/sprugp2a/sprugp2a.pdf)
[^2]: [stackoverflow, spi on beaglebone back](https://stackoverflow.com/search?q=%5Bbeagleboneblack%5D+spi)
[^3]: [youtube, How to use SPI, basic electronics](https://youtu.be/fvOAbDMzoks)
[^4]: [BBB gpio pins numbering](https://vadl.github.io/beagleboneblack/2016/07/29/setting-up-bbb-gpio)
[^5]: [w3schools, howto css_timeline](https://www.w3schools.com/howto/howto_css_timeline.asp)