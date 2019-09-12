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

> Shall goes in, shall goes out

## What is SSH?

- Stands for **S**ecure **SH**ell
- Client `ssh` / Server `sshd` protocol
- appeared in mid 1990s, connecting to remote machines via internet (unsecure n/w)
- Application layer protocol, `sshd` server on standard port `22` 
- older protocols like `telnet` would sent everything in plain text. Not secure over internet
  - packets could be sniffed and read by packet Sniffer

<!-- more -->


## Port Forwarding

Think of your SSH connections as tubes. Big tubes. Normally, you'll reach through these tubes to run a shell on a remote computer.

[SSH Tunneling - Local and Remote Use Cases](https://unix.stackexchange.com/questions/223652/ssh-tunneling-local-and-remote-use-cases)

```
ssh -L 123:localhost:456 user@example.com
```

This will forward all traffic from port 123 on my local machine to port 456 on example.com. But example.com would see the traffic coming from its own localhost.

```
ssh -L 123:google.com:456 user@example.com
```

This will forward all traffic from port 123 on my local machine to port 456 on google.com. After that it will establish an ssh session to example.com.

situation when example.com can connect to [google.com] host while your box can't. For example, you have VPN connection which is restricted to a number of boxes, while you want to access host not in list. ssh -L 123:target.host.com:456 user@vpn.host.com.

```
ssh -R 123:localhost:456 user@example.com
```

This will establish an ssh session to user@example.com and forward all traffic from port 123 on example.com to port 456 on my local machine. My local machine will then see the traffic as coming from localhost.

```
ssh -R 123:google.com:456 user@example.com
```

This will establish an ssh session to user@example.com and forward all traffic from port 123 on example.com to port 456 on google.com. Unlike #2, example.com is used as the remote host.


### There are three types of port forwarding with SSH:

Local port forwarding: connections from the SSH client are forwarded via the SSH server, then to a destination server

Remote port forwarding: connections from the SSH server are forwarded via the SSH client, then to a destination server

Dynamic port forwarding: connections from various programs are forwarded via the SSH client, then via the SSH server, and finally to several destination servers

Local port forwarding is the most common type. For example, local port forwarding lets you bypass a company firewall that blocks Wikipedia.

Remote port forwarding is less common. For example, remote port forwarding lets you connect from your SSH server to a computer on your company's intranet.

Dynamic port forwarding is rarely used. For example, dynamic port forwarding lets you bypass a company firewall that blocks web access altogether. Although this is very powerful, it takes a lot of work to set up, and it's usually easier to use local port forwarding for the specific sites you want to access.

### How to create a SOCKS PROXY using SSH

Dynamic Port Forwarding, maybe when Port 80 is blocked, 

{{% cmd %}}
ssh -N -D 9055 username@machine 
{{% /cmd %}}

-N      Do not execute a remote command.  This is useful for just forwarding ports.

```
curl http://ifconfig.co/country
ssh -N -D 9055 username@machine 
curl --proxy socks5://127.0.0.1:9055 http://ifconfig.co/country
```
> Using proxy with curl?

either `--proxy` or `--proxytunnel` or environment variable `http_proxy`
Let chrome browser use SOCKS PROXY you created? Advanced proxy -> custome SOCKS
Any address from chrome would now be sent via 8181

> Look at the ssh logs for more interesting details

On Ubuntu servers, you can find who logged in when (and from where) in the file
```
tail --follow /var/log/auth.log | grep sshd
```

SOCKS
: Practically, a SOCKS server proxies TCP connections to an arbitrary IP address, and provides a means for UDP packets to be forwarded.
* SOCKS is a de facto standard for circuit-level gateways

> Remove ssh server? Diabling SSH access

```
systemctl status sshd
systemctl stop sshd
systemctl disable sshd
```

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

Recieving Emails from remote server 

```
myLocalHost% ssh -L localhost:9143:myRemoteHost:143 myRemoteHost 
```

#### Jump Server[^1]

{{% cmd %}}
ssh -L 127.0.0.1:80:intra.example.com:80 gw.example.com

ssh -L 9000:youtube.com:80 user@example.com
{{% /cmd %}}

This example opens a connection to the gw.example.com jump server, and forwards any connection to port 80 on the local machine to port 80 on intra.example.com.

### Remote Port forwarding

- Take any service locally accessable via a visible machine through SSH.
- We do not give away the IP og machine running service
- Make a webapp running on local available to internet via another machine
- share a service running on your machien, through internet

> Difference with LOCAL?

* Connect via vncserver `5901`, ask password and enter it, bam connected. Not very secure
* Forwarda local port to a specific port (where we have already established our tunnel) `80->5901` on local and tunnel is established b/w `5901->remotehost:5901` 

{{% cmd %}}
ssh -R 8080:localhost:80 public.example.com
{{% /cmd %}}

This allows anyone on the remote server to connect to TCP port 8080 on the remote server. The connection will then be tunneled back to the client host, and the client then makes a TCP connection to port 80 on localhost. Any other host name or IP address could be used instead of localhost to specify the host to connect to.

This particular example would be useful for giving someone on the outside access to an internal web server.

- OPENING BACKDOORS INTO THE ENTERPRISE
- Use SSH Port Forwarding to connect to DIFFERENT networks

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

> HOw many users can login into a linux system via SSH? Whats the limit?

When logging in using SSH, you use a pseudo-terminal (a pty) allocated to the SSH daemon, not a real one (a tty).
Pseudo-terminals are created and destroyed as needed. You can find the number of ptys allowed to be allocated at one time at /proc/sys/kernel/pty/max, and this value can be modified using the kernel.pty.max sysctl variable. Assuming that no other ptys are in use, that would be your limit.

`w`, `who`, and `users` are the canonical tools for accessing information about logged in users. last and lastlog also contain historical data.

> X11 Forwarding from docker to localhost 

`ssh -XC username@hostname`

Passwordless access by Cryptographic Keys
How to enable passwordless access for all users on target machine?

## Port Scanning

Get all service with their default port information at `/etc/services`
`nmap`

```
sudo nmap -sS -O localhost
```

$$
where,
-sS scan SYN
-sT scan TCP
-sU scan UDP
-O  os related information
$$

## How to edit remote files from local editor

When vim is compiled with `+clientserver` support

```
vim --version | ack client
+clientserver 

vim scp://user@myserver[:port]//path/to/file.txt
vim scp://root@192.168.120.141/spi-traffic.sh 

OR

sudo apt-get install sshfs
sudo adduser <username> fuse
mkdir ~/remoteserv    
sshfs -o idmap=user <username>@<ipaddress>:/remotepath ~/remoteserv

```

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
7. [Difference b/w a key and certificate wrt SSH?](https://superuser.com/questions/620121/what-is-the-difference-between-a-certificate-and-a-key-with-respect-to-ssl)
8. What is BIND_ADDRESS?[^2]
   1. In general, an address binding is an association between a service (e.g., SSH) and an IP address.
A host may have multiple IP addresses (e.g., 127.0.0.1, 192.168.1.2). Address binding allows you to run a service on some or all of these addresses.
9. How to detect Port Forwarding?
   1.  `nmap` 
10. How to check if we have SSH POrt forwarding enabled?
    1.  `lsof -i | grep LISTEN`

## References

[^1]: https://www.ssh.com/ssh/tunneling/example
[^2]: https://unix.stackexchange.com/questions/236865/what-does-bind-address-mean-in-ssh-port-forwarding
[^3]: https://help.ubuntu.com/community/SSH/OpenSSH/PortForwarding
[^4]: https://www.howtogeek.com/233383/why-was-80-chosen-as-the-default-http-port-and-443-as-the-default-https-port/