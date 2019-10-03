---
title      : "Juju"
date       : 2019-08-06T17:11:48+02:00
publishdate: 2019-08-07T17:11:48+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- deployment
tags:
- juju
---

## What is juju?

Juju is an open source <mark>application modelling tool</mark>. It allows you to deploy, configure, scale and operate your software on public and private clouds[^1].

* juju charms like install node, django etc and connect to mongodb
* one charm to rule them all. Devops operations
* Configuration and deployment tool
* Juju by default stores its configuration and state locally in the `~/.local/share/juju` directory
<!-- more -->

Juju can be used locally[^2] using LXD.

## Problem it solves?

How to connect new interfaces, services/instances when application is scaled up?

Juju excels at continue to upgrade the model once its deployed

* scaling application
* upgrading applications
* configuring applications while they are running

Things always change

> Modelling software deployments?

Application is not a single server these days, its a plethora of interconnectedd services


charm
: is a set of action and hooks
+ `actions` are programs
+ `hooks` are events and signals

Developers can simulate a production like real cloud instances/interconnected environment using lightweigt LXD

##  How does it work?

Juju also has a concept of Bundles. A Bundle is a portable specification for a model with charms, configuration, and relations all specified in a declarative YAML format

**Relations** and applications information os provided in YAML descriptor file

```sh

sudo snap install juju --edge --classic

fish_update_completions
juju whoami
juju list-controllers

# Initializes a cloud environment.
juju bootstrap
```

## Specific Terminologies

controller
: A Juju controller is the management node of a Juju cloud environment. It houses the database and keeps track of all the models in that environment.

```sh
juju bootstrap localhost lxd-local
juju controllers --refresh
juju whoami
juju deploy cs:bundle/mediawiki-single
juju status
juju destroy-model default
juju add-model default
juju gui --browser
juju deploy cs:bundle/openstack-base-61
```

## Juju - WHy

* Documentation[^4]
* Stop spending time on Configuration MAnagement - use prebuilt charms
* A software is stuff connected to other stuff
* Hosting Environment
  * Machines
  * Providers
  * Clouds
* Juju Architecture
  * Bundles
    * Charmes
      * Layers
  * Client
  * Controller
  * Agents
* SOftware Medelling
  * Applications
  * Models
  * Units
  * Relations

> The Juju controller will manage:

* Multiple models
* All VMs in all your running models
* Scale out, config and placement
* User accounts and identification
* Sharing and access

## Charms

* [Reactive Programming](https://en.wikipedia.org/wiki/Reactive_programming)
* deploy OS, event handling based interface management
* Bundles
  * Charms
    * Layers `charm layers`
* built in layers, anologous to docker layers
* could be written in bash or python
* `charm build`
* reactive framework
  * juju `hooks`
  * `def install()`
  * `relationship`
* [Components of a charm](https://jaas.ai/docs/components-of-a-charm)
* [Charm store](https://jaas.ai/store)

```
charm create vanilla
juju add-unit -n5 ubuntu            # add 5 units
juju deploy ubuntu mytestmachine1
juju deploy ubuntu mytestmachine2

juju add-model --verbose mediawiki
juju deploy haproxy
juju deploy my-web-app
juju add-relation my-web-app:website haproxy:reverseproxy
juju add-unit my-web-app
juju destroy-model --verbose mediawiki

juju switch avi-os
```

* [HAProxy](https://www.youtube.com/watch?v=1deGB63U7d4)
  * Layer 4 or Layer 7 load balancing
  * Algorithms
    * Round robin
    * Least connections
  * 

### Footnotes

[^1]: [juju, docs](https://jaas.ai/docs)
[^2]: [juju local with LXD](https://jaas.ai/docs/lxd-cloud)
[^3]: https://www.youtube.com/watch?v=yuIt8D5ijYQ
[^4]: https://jaas.ai/docs/getting-started-with-juju
[^5]: https://github.com/juju/hello-juju
