---
title      : "Docker Containers"
date       : 2019-09-05T21:14:16+02:00
publishdate: 2019-09-06T21:14:16+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
tags:
- docker
- container
---

Volumes
: in dockers well very much like regular unix base mounting works.
* Not practical to remove and recreate dockers on every code change

* Docker already caches files in layers with hash
* When you run an image and generate a container, you add a new **writable layer** (the “container layer”) on top of the underlying layers.
* Only the instructions `RUN`, `COPY`, `ADD` create layers.
* For the `ADD` and `COPY` instructions, the contents of the file(s) in the image are examined and a checksum is calculated for each file.
* Use [alpine](https://hub.docker.com/_/alpine/) as base image
* The `VOLUME` instruction should be used to expose any **database storage area**, **configuration storage**, or **files/folders created by your docker container**. You are strongly encouraged to use VOLUME for any mutable and/or user-serviceable parts of your image.
* The `VOLUME` instruction creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers.
  * The host directory is declared at container run-time: The host directory (the mountpoint) is, by its nature, host-dependent. This is to preserve image portability, since a given host directory can’t be guaranteed to be available on all hosts. For this reason, you can’t mount a host directory from within the Dockerfile. The VOLUME instruction does not support specifying a host-dir parameter. You must specify the mountpoint when you create or run the container.


stack
: is a group of interrelated services that share dependencies, and can be orchestrated and scaled together.

[Alpine Linux](https://alpinelinux.org/about/)
: Linux distribution based on `musi` and `Busybox`
* Uses **hardened** kernel
* User-space binaries are <mark>position-independent-executables</mark>
* Quick boot-up times
* The image is **only 5 MB** in size and
* has access to a [package repository ](https://pkgs.alpinelinux.org/packages)
* [Used a lot in containers, because of size and security than ubuntu.](https://hub.docker.com/_/alpine)

[Busybox](https://en.wikipedia.org/wiki/BusyBox)
: provides several Unix utilities in a single executable file.
* Swiss army knife of embedded linux

{{% note %}}
By default, Docker runs a container with a /dev/shm shared memory space 64MB
{{% /note %}}

> Where are docker images and layers stored on system ?

```
docker info
/var/snap/docker
```

> DIfference between ADD and COPY

The `ADD` instruction copies new files, directories or remote file URLs from <src> and adds them to the <mark>filesystem of the **image**</mark> at the path <dest>.

The `COPY` instruction copies new files or directories from <src> and adds them to the <mark>filesystem of the **container**</mark> at the path <dest>.

> How to keep local directory synchronized within container directory?

* --bind
* `--volume`

> HANDLING PERMISSIONS WITH DOCKER VOLUMES

![docker-permission-issue-creating-file-from-container.png](docker-permission-issue-creating-file-from-container.png)

1. If you write to the volume you won't be able to access the files that container has written because the process in the container usually runs as root.
2. You shouldn't run the process inside your containers as root but even if you run as some hard-coded user it still won't match the user on your laptop/jenkins/staging.

```
# Create a localuser in container

ARG USER_NAME=avi
ARG USER_ID=1000
ARG GROUP_NAME=avi
ARG GROUP_ID=1000
RUN groupadd --gid $GROUP_ID $GROUP_NAME \
    && useradd --uid $USER_ID --gid $GROUP_ID $USER_NAME
USER $USER_NAME
COPY . /blog
WORKDIR /blog
VOLUME [ "/blog", ]
```

## Hierarchy

1. swarm - orchestrator
2. stack
3. service - docker compose
4. containers - Dockerfile

## Alternative swarm kubernatives[^1]

* Docker has built in monitoring endpoint for Prometheus
* [Docker swarm orchestrated for monitoring](https://github.com/stefanprodan/swarmprom)
* [docker ELK](https://github.com/deviantony/docker-elk)
* [docker.socks](https://stackoverflow.com/questions/35110146/can-anyone-explain-docker-sock/35110344)
* [swarmpit gui](https://github.com/swarmpit/swarmpit#installation)
* [Portrain.io](https://www.portainer.io/installation/)
  * can scale, kill services from GUI, see logs, ssh into container
* https://askubuntu.com/questions/660091/kubernetes-vs-mesosmarathon-vs-juju-how-to-demystify
* Provision docker daemon to send monitoring data to prometheus[^7]

```
docker swarm init
docker node ls
docker node ps
```

## Docker compose

* Like make file, but for docker services
* List `depends_on`

## [Docker machine](https://docs.docker.com/machine/overview/)

Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage the hosts
with docker-machine commands

```
docker-machine create --driver virtualbox default
docker run -d -p 8000:80 nginx
curl (docker-machine ip default):8000

VBoxManage showvminfo default
VBoxManage list vms / runningvms
```

> `swarm init` versus `docker run swarm create`[^2]


## Docker swarm

* [The relation between “docker/swarm” and “docker/swarmkit”](https://stackoverflow.com/questions/38474424/the-relation-between-docker-swarm-and-docker-swarmkit)
* [swarmkit | swarm mode | swarm container](https://sreeninet.wordpress.com/2016/07/14/comparing-swarm-swarmkit-and-swarm-mode/)
* [swarm examples](https://docs.docker.com/get-started/part4/)

# Container ORchestration Wars

* apache Mesos
* Kubernetes
* Swarn

## Kubernetes

* Container scheduling and Management
* [Minikube for local development and educational purposes](https://minikube.sigs.k8s.io/)
* **Pods** are instances of a container deployment
* **Services** are endpoints that exports ports to outside world
* Kubernetes cheatsheet[^3]
* build your image and then create the kubernetes resources using kubectl command
* Remember to build the images from Dockerfile in K8 context minikube
* Process Sharing between containers
  * Access config files from other containers
    * `head /proc/8/root/etc/nginx/nginx.conf`
* `Kompose` translator service from docker-compose to openstack or K8 envs
  * `./kompose up`
* A **Jobs** in Kubernetes is a supervisor for pods carrying out batch processes, that is, a process that runs for a certain time to completion, for example a calculation or a backup operation.

```
minikube config view
minikube start --vm-driver=virtualbox
kubectl cluster-info
minikube dashboard
kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node

kubectl get nodes
kubectl get deployments
kubectl get pods
kubectl get events
kubectl label nodes <your-node-name> disktype=ssd
kubectl get nodes --show-labels

# schedule the pod
kubectl apply -f https://k8s.io/examples/pods/pod-nginx.yaml

# get container shell access running inside pod
kubectl exec -it init-demo -- /bin/bash

kubectl expose deployment hello-node --type=LoadBalancer --port=8080
kubectl get services
minikube service hello-node
minikube addons list
minikube cache add ubuntu:16.04
minikube cache list
minikube addons list
minikube tunnel - Load Balancing, alters n/w routes

```

## Tasks

* BLue green deployments
* Load Balancing via HAproxy, nginx, swarm cluster
* Deploy a hugo website to K8 clusterp[^4]

## Others

* REDIS **RE**mote **DI**distributed **S**store - in-memoery KV store

## How to write an excellent Dockerfile

1. Keep app versions on top and as Labels, env vars
2. Check `sha256` of downloads and stop on failure

## Docker Network

```
docker-compose up
Creating network "prometheus_default" with the default driver
ERROR: could not find an available, non-overlapping IPv4 address pool among the defaults to assign to the network

docker network ls
docker network prune
```

## Docker Maintenance

```sh
no space left on device
```

https://success.docker.com/article/error-message-no-space-left-on-device-in-default-machine


### Footnotes

[^1]: https://docs.docker.com/config/thirdparty/prometheus/
[^2]: https://stackoverflow.com/questions/48723608/docker-run-swarm-create-vs-docker-swarm-init
[^3]: https://kubernetes.io/docs/reference/kubectl/cheatsheet/#creating-objects
[^4]: https://www.linode.com/docs/applications/containers/kubernetes/deploy-container-image-to-kubernetes/
[^5]: https://medium.com/@soumyadipde/monitoring-in-docker-stacks-its-that-easy-with-prometheus-5d71c1042443