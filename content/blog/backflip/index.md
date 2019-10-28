---
title      : "Backflip"
date       : 2019-09-22T08:27:27Z
publishdate: 2019-09-22T08:27:27Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
- backflip
tags:
-
---

<!-- more -->
[cirrOS](https://launchpad.net/cirros)
: Tiny Os specializes in running on cloud

[Management Interface](https://en.wikipedia.org/wiki/Management_interface)
: a management interface is a network interface dedicated to configuration and management operations.

PED
: Profile Experiment Descriptor
* service package
* service experiments
* https://hub.docker.com/r/mpeuster/tng-bench-mp

[Promethius](https://prometheus.io/)
: from metrics to insight
* on Executor node
  * [cAdvisor](https://github.com/google/cadvisor) 
  * [promethius node-exporter](https://github.com/prometheus/node_exporter)

```
git remote add upstream git@github.com:CN-UPB/tng-sdk-benchmark.git
git fetch upstream
```

iperf
: perform network throughput tests
* either `TCP` or `UDP`

```
iperf --client <IP> --wondow <size KB>
iperf --server
```

* Seperate descriptor file for OSM and VIM_EMU
* A VNFD specifies the involved virtual deployment units (VDUs)
* [Descriptor schema](https://github.com/sonata-nfv/tng-schema)
* [tng-pkg](https://github.com/sonata-nfv/tng-sdk-package)
  * pack/unpack `.tgo` packages
  * [swagger API docs](https://sonata-nfv.github.io/tng-doc/)


### TCP Windowing

* control sending to too much data so that client doesnt fall behind
  * sequencce numbers 
  * Acknowledgements ACK
* Window size is dynamic and changes several times during a communication

## Test IDS suricata and snort

* Hail Mary Attack using [Armitage](http://www.fastandeasyhacking.com/manual) 
* install IDS on [security-onion](https://securityonion.net/) in a VM
  * with 2 network intrfaces
    * Bridge
    * NAT
  * `sguil` - visualization of alterts

```
# Install talos and ET rules
sudo sostat
```


* NBI API Swagger API documentation[^1]


## Questions

* where is `cmd_stop: "./stop.sh"`?

### Footnotes

[^1]: https://forge.etsi.org/swagger/ui/?url=https%3A%2F%2Fosm.etsi.org%2Fgitweb%2F%3Fp%3Dosm%2FSOL005.git%3Ba%3Dblob_plain%3Bf%3Dosm-openapi.yaml%3Bhb%3DHEAD
[^2]:
