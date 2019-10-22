---
title      : "Serial Peripheral Interface"
date       : 2019-09-13T11:22:27+02:00
publishdate: 2019-09-13T11:22:27+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Embedded
categories:
- linux
tags:
- bus
- spi
---

* Official Documentation[^1]
* a multiplexed shift register
* Range 1-20 MHz
* The Raspberry Pi is equipped with one SPI bus that has **2 chip selects**.
<!-- more -->

* We want to use 3 slaves with SPI0, but am335x supports only 2 CS signals.

Device tree configuration for SPI Polarity and Phase

```
		spi-cpol;
		spi-cpha;
```

## Querying Device tree

### From /proc

{{< code numbered="true" >}}
/proc/device-tree/ocp/spi@48030000

root@beaglebone-yocto:/sys/firmware/devicetree/base/ocp/l4_wkup@44c00000/scm@210000/pinmux@800/[[[spi0_pins_default]]]# pwd
/sys/firmware/devicetree/base/ocp/l4_wkup@44c00000/scm@210000/pinmux@800/spi0_pins_default
root@beaglebone-yocto:/sys/firmware/devicetree/base/ocp/l4_wkup@44c00000/scm@210000/pinmux@800/spi0_pins_default# ls -la
total 0
drwxr-xr-x  2 root root  0 Oct 22 14:29 .
drwxr-xr-x 21 root root  0 Oct 22 14:29 ..
-r--r--r--  1 root root 18 Oct 22 14:42 name
-r--r--r--  1 root root  4 Oct 22 14:30 phandle
-r--r--r--  1 root root 40 Oct 22 14:29 pinctrl-single,pins
root@beaglebone-yocto:/sys/firmware/devicetree/base/ocp/l4_wkup@44c00000/scm@210000/pinmux@800/spi0_pins_default# 

mount /dev/mmcblk1p1 /mnt
find . -type f -exec head {} + | less

{{< /code >}}

1. Binary file
2. 

### Using debugfs

* `/sys/kernel/debug`
* `/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pingroups`

{{< code numbered="true" >}}

# pins associated with spi
cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pingroups | grep -A5 -i spi

{{< /code >}}

### From dtb file

Open Core Protocol (OCP)-based architectures
: OCP is a standards-based embedded-bus interface and multicore IP integration protocol defined by the OCP-IP industry consortium

```
fdtget /boot/am335x-boneblack.dtb --list /
fdtget /boot/am335x-boneblack.dtb --properties /
fdtget /boot/am335x-boneblack.dtb --list /cpus
fdtget /boot/am335x-boneblack.dtb --list /ocp     # buses
fdtget /boot/am335x-boneblack.dtb --properties /ocp/spi@48030000
fdtget /boot/am335x-boneblack.dtb /ocp/spi@48030000 --type s status

for i in $PROPS; do out=$(fdtget --type x /boot/am335x-boneblack.dtb spi0 $i); echo -e "$i\t\t$out";  done

fdtput /boot/am335x-boneblack.dtb --verbose --delete /ocp/spi@48030000 status
fdtput /boot/am335x-boneblack.dtb --verbose --remove /ocp/spi@48030000 status
fdtput /boot/am335x-boneblack.dtb --verbose --create /ocp/spi@48030000 status okay
fdtput /boot/am335x-boneblack.dtb --verbose --type s /ocp/spi@48030000 compatible rohm,dh2228fv

```

Testing

```
watch --interval 1 --differences 'PROPS=$(fdtget /boot/am335x-boneblack.dtb --properties /ocp/spi@48030000); for i in $PROPS; do out=$(fdtget /boot/am335x-boneblack.dtb spi0 $i); echo -e "$i\t\t$out";  done'
```

Sample output `fdtdump /boot/am335x-boneblack.dtb --scan | grep -A15 'spi@48030000 {'`

{{% code %}}
spi@48030000 {
    compatible = "rohm,dh2228fv";
    status = "okay";
    #address-cells = <0x00000001>;
    #size-cells = <0x00000000>;
    reg = <0x48030000 0x00000400>;
    interrupts = <0x00000041>;
    ti,spi-num-cs = <0x00000002>;
    ti,hwmods = "spi0";
    dmas = <0x00000027 0x00000010 0x00000000 0x00000027 0x00000011 0x00000000 0x00000027 0x00000012 0x00000000 0x00000027 0x00000013 0x00000000>;
    dma-names = "tx0", "rx0", "tx1", "rx1";
};

{{% /code %}}


ti,spi-num-cs
: Number of chipselect supported  by the instance.




{{< code numbered="true" >}}
&spi0{
    pinctrl-names = "default";
	pinctrl-0 = <&spi0_pins_default>;
    [[[status]]] = "okay";
    #address-cells=<1>;
    #size-cells=<0>;

    spidev@0{
        [[[compatible]]]="spidev";
        reg =<0>; //chipselect 0
        spi-max-frequency= <3125000>;
    };
    spidev@1{
        compatible="spidev";
        [[[reg]]] =<1>; //chipselect 1
        spi-max-frequency= <3125000>;
    };
    spidev@2{
        compatible="spidev";
        reg =<2>; //chipselect 2`
        spi-max-frequency= <3125000>;
    };

imu@X {
     compatible = "adi,adis16480";
     reg = <YOUR_CHIPELECT_PIN_NR>;
     spi-cpol;
     spi-cpha;
     spi-max-frequency = [[[<1000000>]]];
};
{{< /code >}}

1. Driver to use for this device
2. Register where device could be found
3. Control device state, on/off
4. SPI frequency breakpoints 1Mhz, 2MHz, 3.2mHx

## Traffic Generation

```
./spidev_test -v
spidev_test --device /dev/spidev0.0 --verbose -p 'MESSGAE' --speed 250000

# Write binary 1, 2 and 3
echo -ne "\x01\x02\x03" > /dev/spidev0.0
```

### Footnotes

[^1]: https://www.kernel.org/doc/html/latest/driver-api/spi.html?highlight=spi
[^2]: https://ez.analog.com/linux-device-drivers/linux-software-drivers/f/q-a/97600/adis16448-iio-driver-on-nvidia-jetson-tk1
