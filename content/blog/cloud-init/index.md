---
title      : "Cloud-Init"
date       : 2019-10-06T22:16:36Z
publishdate: 2019-10-06T22:16:36Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Cloud
categories:
- deployment
tags:
- cloudinit
---

A technology for automatically configuring Ubuntu Server as it boots into the cloud, turning it from a generic Ubuntu image into a configured server in a few seconds, quickly and easily
<!-- more -->
There are lots of install technologies - Ubuntu also supports Kickstart, but that does not matter.

## What is cloud init?

* cloud technology for initializing ubuntu cloud images
* AMI-AWS Image -> Customize it to final purpose
  * Install softwares
  * Create users
  * import SSH keys
  * run shell scripts
* **Customization Script** is the place to insert config
* [^2]Examples[^1]

ls /sys/class/net
# or
ip addr

Re-run cloud-init config
```
cloud-init.service
journalctl --unit cloud-init.service -o cat

cloud-init clean
cloud-init init
cloud-init query --list-keys
cloud-init features

```


```
packages:
    - tree
    - nginx

groups:
    - avi

users:
    - default`
    - name: avi
      sudo: true

runcmd:
    - [ ls, -l, / ]
    - [ sh, -xc, "echo $(date) ': hello world!'" ]
    - [ sh, -c, echo "=========hello world'=========" ]
    - ls -l /root
    - [ wget, "http://example.org", -O, /tmp/index.html ]

final_message: CLOUD-INIT FINISHED
```

### Footnotes

[^1]: https://cloudinit.readthedocs.io/en/latest/topics/examples.html
[^2]: https://github.com/number5/cloud-init/tree/master/doc/examples
