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
git checkout v4.0
```
## Execute installation

### Step 1

* In the file /tng-devops/host_vars/localhost, replace the version values for the v4.0 installation:
<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/raw/master/images/localhost_variables.jpg" /></p>

* Only for the VnV,you need to replace the lines pointing to the correct SP you want to use:
<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/raw/master/images/localhost_vnv.jpg" /></p>



### Step 2
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

The 5GTANGO SDK tools are supposed to be locally installed on the developer's machine. They are based on Python3 and can be installed using `pip`.

### Requirements

- Ubuntu 16.04 (or later)
- Python 3
- Setuptools

### Installation

- [SDK CLI tools: project, validate, package](/sdk-installation)
- [Emulator (vim-emu)](https://osm.etsi.org/wikipub/index.php/VIM_emulator)
