---
title: Ansible
date: "2019-06-17T12:57:27+02:00"
external_link: https://docs.ansible.com/ansible/latest/index.html
weight: 5
revision: 0
series:
- myLearning
categories:
- deployment
- devops
tags:
- ansible
---

> Configuration Management

* How to install / remove / Update packages
* Ansible, puppet, chef, salt

> Orchestration Tool

* How to deploy a OS / vm image onto infrastructure
* Terraform, OpenStack


### How to get vagrant image with ansible provision?

The Vagrant Ansible provisioner allows you to provision the guest using Ansible
playbooks by executing ansible-playbook from the Vagrant host. Ansible should
be installed on host. [Link here]({{< relref "/blog/virtualization/index.md#vagrant" >}})


# Ansible

## What can it do?
* Configure systems
* Deploy softwares
  * From Apt package manager an pip
  * Download and run make/dpkg -i commands
* Orchestrate IT Tasks
* Zero downtime rolling updates
* Continuous deployments
* Provisioning

## What is Ansible
* Automation language
  * Apt yum [modules]()
  * Template module - src= dest= to copy config files
  * Service: state= name=
  * Handlers:
* Automation engine that runs the Playbooks
* Ansible tower GUI and API
* [GALAXY](https://galaxy.ansible.com/) - community

## How does it work?
* Agentless - uses OpenSSH
* Uses INVENTORIES - list of hosts
* What to run - PLAYBOOK
* Where to run - [INVENTORY FILE](https://github.com/avimehenwal/dotfiles/blob/ubuntu/Excalibur/hostss)
* How to run - Ansible language directives
* PLaybooks -> Tasks (runs sequentially) -> Modules
* HANDLERS are triggered by TASKS

## USe-cases?

* Check if all nodes have same kernel - `yum -a “name=kernel state=latest”`
* [Add mutiple users on hosts](https://github.com/avimehenwal/dotfiles/blob/ubuntu/Excalibur/addUsers.yml)
* [Use with docker containers](https://docs.ansible.com/ansible/latest/scenario_guides/guide_docker.html)

Install or remove a apt package
```
ansible localhost --module-name apt --args "name=tree state=absent" --become --ask-become-pass -vvvv
ansible localhost --module-name apt --args "name=tree" --become --ask-become-pass -vvv
ansible localhost -m shell -a "wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -P $HOME/mySoftwares/vagrant/trusty"
ansible localhost -m git -a "repo=https://github.com/junegunn/fzf.git dest=~/mySoftwares/vagrant/trustyAnsible/fzf"
ansible localhost -m shell -a "git init --bare ./dotfiles"

# Passinv variables from command line
ansible-playbook release.yml --extra-vars "version=1.23.45 other_variable=foo"

# Use tags to run specific parts of playbook
tasks:
- yum:
    name: "{{ item }}"
    state: present
  loop:
  - httpd
  - memcached
  tags:
  - packages

- template:
    src: templates/src.j2
    dest: /etc/foo.conf
  tags:
  - configuration

ansible-playbook example.yml --tags "configuration,packages"
ansible-playbook example.yml --skip-tags "notification"
ansible-playbook --tags "test" ~/playbook.yml -e "sys_user=vagrant" -e "hosts=kjsdiofiosfiosd"

# install configs on localmachine
ansible-playbook ~/playbook.yml -e "sys_user=avi" -e "variable_host=localhost" -vvvv -K
```

## How to run Ansible?
* Has CHECK-MODE, DRY-RUN, VALIDATE run
1. Ad-Hoc command - modules from CMD line
  ```
  ansible web -a /bin/date
  ansible web -m ping
  ```
   * Updating a particular package to test
     * `Ansible web -s -m yum -a “name=openssl state=latest”`
2. From playbooks
   * Tasks are executed in order
3. From Tower UI

### Ansible Roles

Independent variables, tasks, files, templates, and modules.

```
# Directory structure is important
ansible-galaxy init vivekrole

```

### Know HOWs
* Ansible by default assumes you are using **SSH keys**. SSH keys are encouraged else use **--ask-pass**. If using sudo features and when sudo requires a password, also supply **--ask-become-pass**
* **--private-key** for pem keys
* Importing playbooks is possible
  - `import_playbook: webservers.yml`
* Ansible uses **Jinja2** templating to enable dynamic expressions and access to variables
* Working with conditions use `when` directive