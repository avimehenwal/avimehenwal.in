---
title      : "OSM"
date       : 2019-07-22T11:22:43+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- deployment
tags:
- osm
---

SO / RO
: Service and Resource Orchestration
* Now replaced by NBI

VDU
: Virtual Deployment Unit

juju
: Juju is an open source application modelling tool. With it, you can deploy, configure, scale, and operate your software on public and private clouds

![OSM Architecture](OSM-architecture.png)

* ETSI-hosted open source management and orchestration (MANO) community project
* `yang` parser to parse `NTCONF`
* git pull --rebase before pushing changes
* OSM `commit-msg` hook
* [Run OSM on vagrant](https://osm.etsi.org/wikipub/index.php/How_to_run_OSM_on_Vagrant)

In order for OSM to work, it is assumed that:

+ Each VIM has an API endpoint reachable from OSM
+ Each VIM has a so called management network which provides IP address to VNFs
+ That management network is reachable from OSM
+ `OSM client`, a python-based CLI for OSM, will be available as well in the host machine. Via the OSM client, you can manage descriptors, NS and VIM complete lifecycle.[^6]

### Supported VIMs[^6]

1. OpenVIM
2. OpenStack
3. VMware vCloud
4. AWS

{{% note %}}
we can add VIMs into OSM either by **client** or **UI**[^6]
{{% /note %}}

## NBI - North Bound Interface[^1]

* REST-full following ETSI SOL005 standard
* Basic authentication or no authentication is also possible changing 'nbi.cfg' file
* From the architecture it looks like `osmclient` and `lightui` are using NBI

### Capabilities of vim-emu? What can it do?

*

### Footnotes

[^1]: https://osm.etsi.org/wikipub/index.php/OSM_Release_SIX_Documentation
[^2]: [Pyang a NETCONF parser](https://github.com/mbj4668/pyang)
[^3]: [NETCONF RFC](https://tools.ietf.org/html/rfc6241)
[^4]: [Examples of hackerfest](https://osm.etsi.org/wikipub/index.php/Examples_from_OSM_Hackfests#Hackfest_material)
[^5]: [OSM source code](https://osm.etsi.org/gitweb/)
[^6]: [Installation via apt, vagrant](https://osm.etsi.org/wikipub/index.php/OSM_Release_SIX)
[^7]: [Day-0, day-n configuration](https://community.cisco.com/t5/nso-developer-hub-blogs/day-1-day-0-day-1-day-2-n-configurations/ba-p/3658255)
