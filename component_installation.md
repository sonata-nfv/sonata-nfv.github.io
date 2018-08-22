---
layout: default
title: Overview of Component Installation 
---

# Installation

## General instructions and main steps

The 5GTANGO system consists of the Service Platform for deploying and orchestrating services and the Service Development Kit to create deployable service packages. For running services, the Service Platform uses the capabilities of a VIM (virtual infrastructure manager), specifically OpenStack. In order to use the Service Platform, you therefore need to have access to a running OpenStack installation.

In general, the main steps to install a working 5GTANGO system are as follows:

1.  Install the Service Platform
2.  Install the VnV
3.  Install the Service Development Kit
5.  Install the Emulator for testing purposes
5.  Install OpenStack (or get access to an existing installation).
6.  Connect the Service Platform to OpenStack


## Service Platform and VnV installation

## Recomended specs for the virtual machines
SP VM
* Cpu: 4 cores
* Ram: 8 GB
* Hdd: 80 GB

VnV VM
* Cpu: 1 cores
* Ram: 4 GB
* Hdd: 60 GB

## Create tango user
```bash
sudo adduser tango
sudo usermod -a -G sudo tango
```

## Packages installation
```bash
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get install -y git
sudo apt-get install python3
sudo apt install python3-pip
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10 
sudo pip3 install docker
```

## Docker-ce
```bash
sudo apt-get update
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
```

## Create docker network
```bash
sudo docker network create tango	
```

## Repository cloning
```bash
git clone https://github.com/sonata-nfv/tng-devops.git
cd tng-devops
```
## Execute installation
* For SP: `sudo ansible-playbook roles/sp.yml -i environments -e target=localhost --ask-vault-pass`
* For VnV: `sudo ansible-playbook roles/vnv.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`

After these steps, the installation of SP and VnV are finished are finished.
 
 
###
###
###
###
###
###
###

 
 
 
 
  

### Installation Videos

[https://asciinema.org/a/44MwPYliuOxxYBFkkm7M8eqM4 Sonata SP v3.0 installation video]

## SDK

The goal of the 5GTANGO SDK is to assist the developer in designing services and/or functions. The SDK is mainly composed by a set of CLI tools, each with a specific purpose following the development workflow.

### Pre-requisites

The 5GTANGO SDK tools are all implemented in Python:

- Ubuntu 16.04 (or later)
- Python 3 (vim-emu: Python 2.7)
- Setuptools

### tng-sdk-descriptorgen
(Strefan)

### tng-sdk-project

Single command installation:

```bash
pip install git+https://github.com/sonata-nfv/tng-sdk-project.git
```

Usage:

```bash
tng-sdk-project -h
```

User manual and documentation: [GitHub repository and wiki](https://github.com/sonata-nfv/tng-sdk-project.git)

### tng-sdk-img
(Askhat)

### tng-sdk-sm
(Thomas)

### tng-sdk-validate
(Anton? Dani?)


Single command installation:

```bash
pip install git+https://github.com/sonata-nfv/tng-sdk-validation
```

Usage:

```bash
tng-sdk-validate -h
```

User manual and documentation: [GitHub repository and wiki](https://github.com/sonata-nfv/tng-sdk-validation)

### tng-sdk-package

Single command installation:

```bash
pip install git+https://github.com/sonata-nfv/tng-sdk-package
```

Usage:

```bash
tng-sdk-package -h
```

User manual and documentation: [GitHub repository and wiki](https://github.com/sonata-nfv/tng-sdk-package)

### vim-emu (former son-emu)

This emulation platform was created to support network service developers to locally prototype and test their network services in realistic end-to-end multi-PoP scenarios. It allows the execution of real network functions, packaged as Docker containers, in emulated network topologies running locally on the developer's machine. The emulation platform also offers OpenStack-like APIs for each emulated PoP so that it can integrate with MANO solutions, like OSM. The core of the emulation platform is based on [Containernet](https://containernet.github.io).

The original project was called `son-emu` and later renamed to `vim-emu` when the emulator was adopted by the OSM project. We keep the repository name `son-emu` to not break existing links in publications.

The emulation platform `vim-emu` is developed as part of OSM's DevOps MDG.


#### Pre-requisites

The emulator requires a Ubuntu 16.04 LTS installation on a bare motel machine or a VM. The following packages need to be installed:

-   Docker

#### Docker-based installation

This steps deploy and start the emulator inside a Docker container. See the [GitHub repository](https://github.com/sonata-nfv/son-emu) for further installation options.

```sh
git clone https://github.com/sonata-nfv/son-emu
cd ~/son-emu
# build the container:
docker build -t vim-emu-img .
# run the (interactive) container:
docker run --name vim-emu -it --rm --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock vim-emu-img /bin/bash
```

More details about and documentation can be found in the [GitHub wiki](https://github.com/sonata-nfv/son-emu/wiki).
