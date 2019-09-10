---
title      : "Secure Shell"
date       : 2019-09-09T20:35:31+02:00
publishdate: 2019-09-10T20:35:31+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Linux
categories:
- os
tags:
- ssh
---

## What is SSH?

- Stands for **S**ecure **SH**ell
- Client/Server protocol
- appeared in mid 1990s, connecting to remote machines via internet (unsecure n/w)
- Application layer protocol, port `22`
- older protocols like `telnet` would sent everything in plain text. Not secure over internet
  - packets could be sniffed and read by packet Sniffer
<!-- more -->


### How to create a SOCKS PROXY using SSH

Dynamic Port Forwarding, maybe when Port 80 is blocked, 

{{% cmd %}}
ssh -N -D 9055 username@machine 
{{% /cmd %}}

Let chrome browser use SOCKS PROXY you created? Advanced proxy -> custome SOCKS
Any address from chrome would now be sent via 8181

> Look at the ssh logs for more interesting details

SOCKS
: Practically, a SOCKS server proxies TCP connections to an arbitrary IP address, and provides a means for UDP packets to be forwarded.
* SOCKS is a de facto standard for circuit-level gateways


#### [Proxy Chains](https://github.com/haad/proxychains)

Save them in `ssh/config` and quickly jump around proxies
Managing multiple keys?

```
DynamicForward 9050
```

## Reverse Forwarding

{{% cmd %}}
ssh -R 8181:localhost:3389 user@machine
{{% /cmd %}}

## Crack SSH password?

* scan network with `nmap`
* Connect to the SAME we want to attack
* Find a target computer
  * `nmap -sS 192.168.0.1 -A`
* Creata a `wordlist` or dictionary file to attack
* Brute force with `hydra`
  * `hydar -l AttackComputer -p 'wordlist.txt' 192.168..0.8 ssh` 

## SSH LOCAL and REMOTE Port Forwarding

```
ssh -L 22222:localhost:33333 dirk@192.168.100.1
ssh -R 1234:localhost:4321 test@10.10.10.10
```
### Local Port Forwarding

#### Jump Server[^1]

{{% cmd %}}
ssh -L 127.0.0.1:80:intra.example.com:80 gw.example.com
{{% /cmd %}}

This example opens a connection to the gw.example.com jump server, and forwards any connection to port 80 on the local machine to port 80 on intra.example.com.

### Remote Port forwarding

{{% cmd %}}
ssh -R 8080:localhost:80 public.example.com
{{% /cmd %}}

This allows anyone on the remote server to connect to TCP port 8080 on the remote server. The connection will then be tunneled back to the client host, and the client then makes a TCP connection to port 80 on localhost. Any other host name or IP address could be used instead of localhost to specify the host to connect to.

This particular example would be useful for giving someone on the outside access to an internal web server.

OPENING BACKDOORS INTO THE ENTERPRISE

## SSH Keys

* `ssh-keygen`
  * RSA
  * DSA
  * ECDSA
  * ED25519
    * elliptic curve cryptography that offers a better security with faster performance compared to DSA or ECDSA.
    * `ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "john@example.com"`
* authorized key 
* identity key
* ssh-agent
  * keeps decrypted key in memory

> HOw to generrate keys and add them?

```
ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 221 username@remote-server.org
ssh-agent
eval (ssh-agent)
ssh-add ~/.ssh/id_ed25519
```

> Disable the Password for Root Login?

```
sudo nano /etc/ssh/sshd_config
PermitRootLogin without-password
sudo systemctl reload sshd.service

```

#### How to Running a command script from localmachine on remote machine

```sh
# Pseudo terminal individual command
ssh user@machine lsb_release --all
ssh root@192.168.120.195 -T uname -a

# Pesudo terminal script
ssh user@machine 'bash -s' < local_script.sh
```

> X11 Forwarding from docker to localhost 

`ssh -XC username@hostname`

Passwordless access by Cryptographic Keys
How to enable passwordless access for all users on target machine?

## Questions

1. Can as add base configuration for all hosts in `ss/config` file? Hierarchy based config, and then the host spefic config?
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
```
2. [Why dont we write chat on SSH?](https://medium.com/@shazow/ssh-how-does-it-even-9e43586e4ffc)
3. How to use remote interpretors (like python) on remote machine from localhost?
4. Remote Development using SSH?
5. How to find out which port is used by client to send request?
   1. `sudo netstat --tcp --programs --numeric | grep ssh`
6. Difference b/w VPN and PROXY?
   1. All / specific apps/traffic

## References

[^1]: https://www.ssh.com/ssh/tunneling/example