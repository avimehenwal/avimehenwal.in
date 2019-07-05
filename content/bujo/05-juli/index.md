---
title      : "05 Juli Friday"
date       : 2019-07-05T11:00:20+02:00
slug       : ""
series     : [DailyLogs]
categories : []
tags       : []
revision   : 0
---

* over-the-air software updates
* update manager supports both
  * application and 
  * system updates

<!-- more -->

meta-mender[^1] - 
: is a yocto layer that can deploy image updates
* automatic roll-back
* remote management
* logging and reporting

meta-mender-core
: Cross-compiling Mender for ARM devices
* Partitioning the image correctly
* Setting up the U-Boot bootloader to support Mender

udev - userspace /dev
: is a device manager for the Linux kernel.
* checks when new device is plugged in and makes it available as a FILE

Gyroscopes
: measure orientation and angular velocity

Business models for open-source software[^3]
: whose source code is publicly available under an open-source license to study, change, and improve its design.
* Examples Mozilla Firefox, Google Chromium, Android, LibreOffice and the VLC media player.
* Open-source software development has been a large part of the creation of the World Wide Web as we know it, with Tim Berners-Lee contributing his HTML code development as the original platform upon which the internet is now built.
* For example, most contributors to GCC or to the Linux kernel are professionals (and contributing about full time and paid for that). These projects are too complex to be worked on as a hobby.
* Bounty hunting programs[^2]

What do one need for testing?

1. test scripts, instructions
2. data and
3. documentation

![What nobody tells you about documentation](documentation.png)[^4]

## VUE vs React and Angular

+ vue has shorter learning curve than react
+ Dont have to deal with JSX transpilers
+ 2-way data binding
+ Templating - JSON data binding
+ Component structure with OOPs programming methodologies
  + builtin components
+ Progressive image loading like on medium (vue has that inbuilt)


gap to fill javascript fatigue

Client side rendering components

- routing
- templating
- JS syntax (like JSX)

## Mender

Press <kbd>space</kbd> to interrupt bootloader

* clock is important
* bootloader choice
* powerloss at update, may make device unusable
* printenv, setenv, reset, boot
* watch where env var is written /etc/uboot something
* 

## Questions ?

1. How to have automatic cross-links and references in my documentaion and website?
2. 



### Footnotes

[^1]: [building a mender yocto project image](https://docs.mender.io/2.0/artifacts/yocto-project/building)
[^2]: [issuehunt, get paid to solve open-source project issues](https://issuehunt.io/)
[^3]: https://en.wikipedia.org/wiki/Business_models_for_open-source_software
[^4]: [What nobody tells you about documentation](https://www.divio.com/blog/documentation/)
[^5]: [gridsome](https://gridsome.org/)
[^6]: [vuepress](https://vuepress.vuejs.org/)
