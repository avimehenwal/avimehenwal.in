---
title: Virtualization
date: "2019-06-19T18:26:00+02:00"
revision: 0
series:
- edublog
categories:
- deployment
- embedded
- devops
tags:
- vagrant
- virtualization
- docker
video: ""
---

## Virtualization

[ovmf](https://www.linux-kvm.org/page/OVMF)
: OVMF "is a project to enable UEFI support for Virtual Machines"
* can run `wic` image

Virtualization
: abstraction layer which make a s/w (like OS) installed on shared h/w
as if its native and completely isolated from other s/w apps.
* Virtualization saved cost and reuse hardware infrastructure.[^1]

> Sharing a common development environment with everyone on your team

### Types of virtualization

* Server virtualization + total isolation
    * **Type 1 -** Hypervisor runs as native
      * **KVM** Kernel-Based Virtual Machine
      * VMware ESX,
      * Citrix XenServer
      * Microsoft’s Hyper-V.
    * **Type 2 -** Hypervisor runs on top of OS
      * Oracle virtualbox
      * VMware Workstation
      * SWSoft’s Parallels Desktop.
      * LinuX Containers (LXC)/Docker
        * they dont require a full-fledged guest OS like virtual machines
* Network virtualization
* Storage virtualization
* Service/ Application virtualization

### Blacklisting a hypervisor

```
lsmod | grep -i kvm
echo 'blacklist kvm-intel' >> /etc/modprobe.d/blacklist.conf

# Virtualbox Guest Additions
sudo apt-get install linux-headers-$(uname -r) build-essential dkms
```

## Vagrant

- the command line utility for managing the lifecycle of virtual machines.
- script the virtual machine configuration as well as the provisioning

Base images like `bento` are important to have clean slate starting point.

{{% warning %}}
<h5>don't use vagrant in production</h5>
vagrant boxes are built with security holes in it to allow smooth scripting/ssh/tunnelling/sudo (no passphrase, known password : vagrant).
{{% /warning %}}

Vagrant File sections and structure

{{< code numbered="true" >}}
Vagrant.configure("2") do |config|
  [[[config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "myUbuntuBionic"
  config.vm.synced_folder "src/", "/var/www/html"]]]

  [[[config.vm.provider "virtualbox" do |vb|
    vb.name = "myExcalibur"
    vb.memory = "1024"
    vb.cpus = "1"
    vb.gui = false
  end]]]

  [[[config.vm.provision "ansible" do |ansible|
    ansible.extra_vars = {
      variable_host: "all",
      sys_user: "vagrant",
      variable_dotfile: "true"
    }
    # ansible.verbose = "v"
    # ansible.tags=["cleanup", "dotfile"]
    # ansible.tags="cleanup"
    ansible.playbook = "dotfiles.yml"
  end]]]
end
{{< /code >}}

1. Vagrant base box section
2. provider `virtualbox`, `Hyper-V`, `docker` (doesnt require `config.vm.box` section)
3. [Vagrant provision `Ansible`]({{< relref "/blog/Ansible.md" >}})

> Start with uncluttered basebox, install apps on top of and then package it to be reused

```
# List all intalled vagratn boxes
vagrant box list
```

#### FAQ

> Is it possible to pass values from command line to Vagrant File?

You cannot pass any parameter to vagrant. The only way is to use environment variables
```
MY_VAR='my value'
vagrant up
```

And use `ENV['MY_VAR']` in recipe.

> What exactly does `vagrant snapshot` save ?

Vagrant snapshots just call the provider "snapshots" method. So Vagrant snapshot on virtualbox just calls virtualbox snapshot.

> Package and reuse your own vagrant box

```
# BUILD
# 1. Downaload ot init a vagrant basebox or bentobox
# 2. Install required softwares, createa a ansible provision playbook or shellscript
# 3. Package to resue
vagrant package --output mynew.box --base NAME --vagrantfile FILE Vagrantfile to package with the box
```

## Packer

- Builder builds an OS image for various environments like
  - AWS
  - Azure
  - DigitalOcean
  - Docker
  - Hyper-V
  - LXC
  - OpenStack
  - Parallels
  - QEMU
  - VirtualBox
  - VMware
- **The Template** contains instructions in simple JSON format
- Packer only builds images. It does not attempt to manage them in any way
- The real utility of Packer comes from being able to install and configure software into the images as well, provision step.
- *shell* provisioner to install user apps and packages
- cmdline tools fits nicely in continuous delivery pipeline
- consistent images for multiple platforms in parallel,

```
{
  "builders": ["..."],
  "provisioners": ["..."],
  "post-processors": ["vagrant"]
}
```

Abbr | Expanded
-----|--------
AMI | Amazon Machine Image

## Docker

- uses kernel **cgroup** and **namespacing** via **LXC**.
- `Boot2Docker` (minimal OS that can run Docker).
- Docker is a program (and much more) that runs containers.
- Could be automated with `docker-compose` or [`ansible`]({{< relref "blog/Ansible.md" >}}/)

Where are docker images stored?
: in your machine’s local Docker image registry.
* `docker info`

> Running docker container

```
docker pull ubuntu
docker run --interactive --tty ubuntu bash
```

### Automating docker containers with Ansible



## Questions

1. Can I build linux from source and run it from virtualbox?
2. Virtualbox can run ISO images, how to get ISO from compiled linux kernel?


##  References

- https://en.wikipedia.org/wiki/Virtualization
- https://stackoverflow.com/questions/16647069/should-i-use-vagrant-or-docker-for-creating-an-isolated-environment
- http://danilodellaquila.com/en/blog/openstack-in-a-local-vagrant-box

[^1]: [yt, diff b/w kvm,virtualization](https://www.youtube.com/watch?v=KBvYlppukUo) 