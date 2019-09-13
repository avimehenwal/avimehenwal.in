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

<!-- more -->

* We want to use 3 slaves with SPI0, but am335x supports only 2 CS signals.

Device tree configuration for SPI Polarity and Phase

```
		spi-cpol;
		spi-cpha;
```

## Querying Device tree

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
        reg =<2>; //chipselect 2
        spi-max-frequency= <3125000>;
    };
{{< /code >}}

1. Driver to use for this device
2. Register where device could be found
3. Control device state, on/off

### Footnotes

[^1]:
[^2]:
