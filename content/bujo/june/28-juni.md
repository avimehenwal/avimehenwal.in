---
categories:
- embedded
date: "2019-06-28T09:53:10+02:00"
revision: 1
series:
- myLearning
tags:
- fish
- system-bus
title: 28 Juni
weight: 5
---

#### How to test files and directories in fish shell?

use fish `test` operator

```
if test -e /path/filename
    echo "File exists"
end

if test -d /directory/
    echo "Directory exists"
end

```

#### how to set environment variables in fish shell?

```
set --[global|local|universal] --export/x <variable_name>
```

# Bus Protocols

Buses provides a communication path between peripheral devices and enable data transfer.

## I2C - Inter Integrated Circuit

I2C is a bidirections, two-wired, serial bus that is suitable for applications requiring
occasional communication over a *short distance* between many devices.
The I2C bus supports 7-bit and 10-bit address space device and has 2 signal lines

SDA
: Serial Data Line, driven either by master or peripheral device

SCL
: Serial Clock Line, driven by master

slaves
: are other peripheral devices such as ADC (Analog to Digital Conversion), EEPROM, DAC (Digital to Analog converter)
wherein each slave consists of a unique address

### Data transfer speed

1. standard 0Hz to 100Hz
2. fast-mode 0Hz to 400 KHz and
3. high-speed-mode 10 KHz to 100KHz.

### Testing i2c bus using on device

I2C Basic Commands Sequence

- transfer data to slave devices
- Master to slave Write operation, write data to slave
- Read Operation Slave to Master

i2c-tool Command	Description

| i2c-tool command          | Description             |
|--------------------------:|:------------------------|
| i2cdetect                 | bus scanning            |
| i2cdump                   | examine I2C registers   |
| i2cget                    | Device register reading |
| i2cset                    | set I2C registers       |


#### How to list all i2c buses available on device?

Lists all the available buses configured on device

```
    root@beaglebone-yocto:~# i2cdetect -l
    i2c-1	i2c       	OMAP I2C adapter                	I2C adapter
    i2c-0	i2c       	OMAP I2C adapter                	I2C adapter
```


Detect devices connected to i2c bus

```
    root@beaglebone-yocto:~# i2cdetect -y 0
    Warning: Can't use SMBus Quick Write command, will skip some addresses
        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                                                 
    10:                                                 
    20:                                                 
    30: -- -- -- -- 34 -- -- --                         
    40:                                                 
    50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
    60:                                                 
    70:                                                 
```

{{% note %}}
the ones showing **UU** denote this address is currently in use by a driver,
while devices without a registered driver show the address (in the example 0x60).
{{% /note %}}

#### How to reading from slave registers?

Read and dump everythig from slave registers to stdout

```
    root@beaglebone-yocto:~# i2cdump -y 0 0x34
    No size specified (using byte-data access)
        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
    00: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    10: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    20: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    30: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    40: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    50: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    60: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    70: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    80: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    90: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    a0: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    b0: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    c0: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    d0: 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12    ????????????????
    e0: 12 12 12 12 12 12 12 12 12 12 12 12 01 00 00 4a    ?????????????..J
    f0: 2e 00 00 fc ca 81 10 ff 00 00 00 82 00 00 00 06    ...????....?...?
```

#### How to set and read from individual slave register

```sh
i2cset
i2cget
```

## SPI - Serial Peripheral Interface[^1]

* Beagle bone hase 2 SPI buses available.
* Has better range than i2c

**SPI-0** is configured and available on device along with **spidev_test** utility.


#### How to testing SPI using spidev_test utility?

On the slave, run:

```
    root@beaglebone-yocto:~# spidev_test -D /dev/spidev0.0 -v
    spi mode: 0x0
    bits per word: 8
    max speed: 500000 Hz (500 KHz)
    TX | FF FF FF FF FF FF 40 00 00 00 00 95 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF F0 0D  | ......@....�..................�.
    RX | FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  | ................................
```

> spi mode = Clock polarity (CPOL) X Clock Phase (CPHS)


On the master (another device, another SPI port, or an SPI analyzer) send a similar message "MASTER_HELLO_TO_SLAVE".
Note that it must send the exact number of bytes the slave expects.
If the master is another Linux device or port, you can use the spidev_test application as well:

```
    $ spidev_test -D /dev/spidev0.0 -p "SLAVE_HELLO_TO_MASTER" -v
    The slave is now blocked waiting to receive clocks from the master, to shift out the message.

    $ spidev_test -D /dev/spidev0.0 -p "MASTER_HELLO_TO_SLAVE" -v
    If it is an analyzer, you may send the message "MASTER_HELLO_TO_SLAVE" in hexadecimal:

    4D 41 53 54 45 52 5F 48 45 4C 4C 4F 5F 54 4F 5F 53 4C 41 56 45
```


## CAN - Controller Area Network

can is a serial connection protocol which allows communication without a host computer.
BeagleBoneBlack has two internal CAN-Bus controller which are called **DCAN0** and **DCAN1**

**can0** is configured on device alongwith **canutils**

The pins of the DCAN0-interface are multiplexed to the connector as per table below


#### How to testing CAN using canutils?

**Cansend** is used to transmit individual frames directly onto the CANbus and **candump** to read the frames.

```
$ cansend can0 5A1#11.22.33.44.55.66.77.88
$ cansend can0 -i 0x123 0xaa 0xbb 0xcc 0xdd
$ cat /proc/net/can/stats 

    2 transmitted frames (TXF)
    2 received frames (RXF)
    0 matched frames (RXMF)

    0 % total match ratio (RXMR)
    0 frames/s total tx rate (TXR)
    0 frames/s total rx rate (RXR)

    0 % current match ratio (CRXMR)
    0 frames/s current tx rate (CTXR)
    0 frames/s current rx rate (CRXR)

    0 % max match ratio (MRXMR)
    1 frames/s max tx rate (MTXR)
    2 frames/s max rx rate (MRXR)

    0 current receive list entries (CRCV)
    1 maximum receive list entries (MRCV)

    1 statistic resets (STR)


$ candump can0
can0 5A1 [8] 11 22 33 44 55 66 77 88
```

By default **canplayer** will replay a logfile back onto the interface recorded in the log file.

```
    $ canplayer -I candump-2017-05-19_101301.log
    Using the log file below

    $ cat candump-2019-05-19_101301.log
    (1495188791.945939) can0 0DF805A0#002B87A93FFCEDC4
    (1495188791.945961) can0 0DF805A0#012800586711CFDB
    (1495188791.945970) can0 0DF805A0#02490800F41547C4
    (1495188791.945979) can0 0DF805A0#03D26E0380662300
    Will produce

    $ candump can0
    vcan1 0DF805A0 [8] 00 2B 87 A9 3F FC ED C4
    vcan1 0DF805A0 [8] 01 28 00 58 67 11 CF DB
    vcan1 0DF805A0 [8] 02 49 08 00 F4 15 47 C4
    vcan1 0DF805A0 [8] 03 D2 6E 03 80 66 23 00
```

It is possible to tell canplayer to play messages recorded on one interface back on another interface.

```
    $ canplayer -I candump-2017-05-19_101301.log can0=vcan1
    will play messages recorded on vcan1 on can0 interface to produce

    $ candump can0
    can0 0DF805A0 [8] 00 2B 87 A9 3F FC ED C4
    can0 0DF805A0 [8] 01 28 00 58 67 11 CF DB
    can0 0DF805A0 [8] 02 49 08 00 F4 15 47 C4
    can0 0DF805A0 [8] 03 D2 6E 03 80 66 23 00
```



### Footnotes

[^1]: [spi tutorial](https://www.corelis.com/education/tutorials/spi-tutorial/)
