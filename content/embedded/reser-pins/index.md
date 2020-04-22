---
title      : "Reset GPIO pins"
date       : 2019-10-22T10:27:45+02:00
publishdate: 2019-10-22T10:27:45+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Embedded
categories:
- linux
tags:
- gpio
- reset
---

GPIO expanders
: for GPIO pins to connect multiple i2c devices when the number of available on board pins are less

/RESET
: in schematics means active low


## GPIO -  General Purpose Input Output

* They are General Purpose Input Output and are pins on various processors that aren’t dedicated to anything.

As a recap, each gpio pin on the BBB has <mark>three different numbering</mark> schemes associated with it!

1. The **physical pin location**, in the form of `PX_Y (P8_28)`
2. The **gpio name**, in the form of `GPIOX_Y (GPIO2_24)`
3. The **gpio number**, in the form of $$32*X + Y (88)$$

{{% warning %}}
Only the last scheme, the gpio number, is used in software!
{{% /warning %}}

The Pi's GPIO ports can be controlled from the command line (i.e. bash), python scripts, and C/C++ programs. There are 17 GPIO ports available on the Pi. Some of them have special purposes or special hardware configurations and should be avoided for normal use.

```
#   Exports pin to userspace
echo "18" > /sys/class/gpio/export

# Sets pin 18 as an output
echo "out" > /sys/class/gpio/gpio18/direction

# Sets pin 18 to high
echo "1" > /sys/class/gpio/gpio18/value

# Sets pin 18 to low
echo "0" > /sys/class/gpio/gpio18/value
```

## How to Reset a sensor via GPIO pin?

Find the sensor register (GPIO Expander)

{{< code numbered="true" >}}
find / -name [[['*03f*']]]
/sys/devices/platform/ocp/4802a000.i2c/i2c-1/1-003f
/sys/bus/i2c/devices/1-003f

gpiochip[[[456]]] -> ../../devices/platform/ocp/4802a000.i2c/i2c-1/1-003f/gpio/gpiochip456
echo [[[457]]] > export

gpio457 -> ../../devices/platform/ocp/4802a000.i2c/i2c-1/1-003f/gpiochip10/gpio/gpio457
cd gpio457
cat value
cat direction
echo 0 > value
echo 1 > value
{{< /code >}}

1. Find on FS by register name
2. 456 appears to be the first Pin
3. Need second pin from IO Expander

```
# RESET ADC /KMD_RESET
cd /sys/class/gpio
echo 457 > export
sleep 1
cd gpio457
find . -maxdepth 1 -type f -exec head {} +
echo out > direction
echo 1 > value
sleep 1
spidev_test --device /dev/spidev0.0 --verbose --cpha --speed 1000000 -p '\x10\x00'
echo 0 > value
find . -maxdepth 1 -type f -exec head {} +
spidev_test --device /dev/spidev0.0 --verbose --cpha --speed 1000000 -p '\x10\x00'
cd ..
echo 457 > unexport
```

## Questions

* What is the difference between GPIO pin and GPIOchip?
*

### Footnotes

[^1]:
[^2]:
