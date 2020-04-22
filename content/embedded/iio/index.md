---
title      : "Industrial IO"
date       : 2019-09-19T10:30:49+02:00
publishdate: 2019-09-19T10:30:49+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Embedded
categories:
- linux
tags:
- driver
- iio
- spi
- i2c
---


<!-- more -->

* Analog Devices Wiki[^2]
* IIO Ossiloscope software[^3]
* High Speed data Acquisition using Linux IIO Framework
  * `~100k` samples per sec
  * Software Defined Radio
  * RF communication
  * Direct RF
  * Ultrasound
  * **ADC** Analog to digital converter **DAC**
* IIO
  * ~200 IIO device drivers (v3.17)
  * Driver Registers a trigger, which is used for each data capture event
  * **DMA** to transfer data from peripheral to memory
  * Efficient read()/write() data between user/kernel space
  * Devices that fall into this category are:
    * ADCs
    * Accelerometers
    * Gyros
    * IMUs
    * Capacitance to Digital Converters (CDCs)
    * Pressure Sensors
    * Color, Light and Proximity Sensors
    * Temperature Sensors
    * Magnetometers
    * DACs
    * DDS (Direct Digital Synthesis)
    * PLLs (Phase Locked Loops)
    * Variable/Programmable Gain Amplifiers (VGA, PGA)

## ADIS16400

Documentation[^5][^6]

> How to make Linux IOT device listen to IMU data from a sensor

* [iio subsystem driver based in to linux kernel](https://github.com/torvalds/linux/tree/master/drivers/iio/imu)
* Adding Linux driver support
  * Enable linux subsystems from `Kconfig` - linux-yocto -> `make menuconfig`

Unlike PCI or USB devices, SPI devices are not enumerated at the hardware level. Instead, the software must know which devices are connected on each SPI bus segment, and what slave selects these devices are using. For this reason, the kernel code must instantiate SPI devices explicitly. The most common method is to declare the SPI devices by bus number.

This method is appropriate when the SPI bus is a system bus, as in many embedded systems, wherein each SPI bus has a number which is known in advance. It is thus possible to pre-declare the SPI devices that inhabit this bus. This is done with an array of struct spi_board_info, which is registered by calling spi_register_board_info()[^1].

* ` /sys/bus/iio/devices/iio:deviceX`
* `libio`

```
root:/sys/devices/platform/bfin-spi.0/spi0.1/iio:device0> cat name
adis16400

for item in `ls`
do
  value=`cat $item`
  printf "%s\t%s\n" $item $value
done

# Read SPI statistics
/sys/devices/platform/ocp/48030000.spi/spi_master/spi0/spi0.1/statistics

cat /proc/interrupts
```


### Footnotes

[^1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/spi/spi-summary.rst
[^2]: https://wiki.analog.com/wiki/introduction
[^3]: https://wiki.analog.com/resources/tools-software/linux-software/iio_oscilloscope
[^4]: https://events.static.linuxfound.org/sites/events/files/slides/iio_high_speed.pdf
[^5]: https://source.codeaurora.org/external/imx/linux-imx/tree/Documentation/ABI/testing/sysfs-bus-iio?h=imx_4.1.15_2.0.0_ga
[^6]: https://www.kernel.org/doc/html/v4.14/driver-api/iio/intro.html
