---
title      : "Continuous Delivery Pipelines"
date       : 2019-08-08T10:15:19+02:00
publishdate: 2019-08-09T10:15:19+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- CI/CD
categories:
- deployment
tags:
- ci
- cd
---

## Continuous Methodologies

Continuous Integration - [CI](https://en.wikipedia.org/wiki/Continuous_integration)
:  is the practice of merging all developers' working copies to a shared mainline several times a day
* Automate a build
* Code Quality Reports
* Self-testing build and code at every commit
* Browser Performance Testing
* Everyone can see the results

[Continuous Delivery](https://continuousdelivery.com/)- [CD manually](https://en.wikipedia.org/wiki/Continuous_delivery)
: Practise of ensuring automatedly that s/w can be relased reliably any time.

Continuous Deployment [CD automatically](https://en.wikipedia.org/wiki/Continuous_deployment)
: similar to CD
<!-- more -->

Gitlab Runner
: runs jobs and sends results back to Gitlab
* opensource project written in `go`, single binary file
* Install and register Gitlab Runner
* [Gitolab runner commands](https://docs.gitlab.com/runner/commands/README.html)
* 

There are several available [EXECUTORS](https://docs.gitlab.com/runner/executors/README.html)

1. SSH
2. Shell
3. VirtualBox
4. Docker
5. Kubernetes

[Further Gitlab Ci Examples](https://gitlab.com/gitlab-examples?page=1)

{{< code numbered="true" >}}
[[[image:]]] ruby:2.3

[[[pages:]]]
  [[[script:]]]
  - bundle install
  - bundle exec jekyll build -d public
  [[[artifacts:]]]
    paths:
    - public
  only:
  - master
{{< /code >}}

1. Tells gitlab-runner to use `docker` executor with mentioned image
2. Name of the job
3. Actual commands to run for the job
4. Collect artifacts after running the script

{{< code numbered="true" >}}
gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "PROJECT_REGISTRATION_TOKEN" \
  --description "python-3.5" \
  --executor "docker" \
  [[[--docker-image]]] python:3.5 \
  --docker-postgres latest
{{< /code >}}

1. Docker container linking


trap
: perform an action when the shell receives a signal
* HUP INT QUIT ILL TRAP ABRT BUS FPE KILL USR1 SEGV USR2 PIPE ALRM TERM STKFLT CHLD CONT STOP TSTP TTIN TTOU URG XCPU XFSZ VTALRM PROF WINCH POLL PWR SYS
* `trap cleanup EXIT`
* `trap cleanup SIGINT SIGTERM SIGQUIT`

id
: print real and effective user and group IDs
* uid=1000(avi) gid=1000(avi) groups=1000(avi),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin),126(sambashare),127(docker),130(libvirt)

getent
: get entries from Name Service Switch libraries
* `getent group`
* `getent passwd`

ufw
: program for managing a netfilter firewall

tr
: translate or delete characters
* `tr -d ' '`
* `echo "avi m" | tr --delete 'av'` i m

tput
: initialize a terminal or query terminfo database
* `tput init`


timesyncd.conf, timesyncd.conf.d
: Network Time Synchronization configuration files