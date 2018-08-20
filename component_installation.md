---
layout: default
title: Overview of Component Installation 
---

# Installation

## General instructions and main steps

The SONATA system consists of the Service Platform for deploying and orchestrating services and the Service Development Kit to create deployable service packages. For running services, the Service Platform uses the capabilities of a VIM (virtual infrastructure manager), specifically OpenStack. In order to use the Service Platform, you therefore need to have access to a running OpenStack installation.

In general, the main steps to install a working SONATA system are as follows:

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

After these steps, the installation is finished.
 
 
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

The goal of the SONATA SDK is to assist the developer in designing services and/or functions. The SDK is mainly composed by a set of CLI tools, each with a specific purpose following the development workflow.

### Pre-requisites

The CLI tools have the following pre-requisites:

-   python 3 (3.4 used for most of the development)
-   virtualenv
-   docker (used by son-monitor)
-   docker-compose (used by son-monitor)

### Installation options

son-cli can be installed via the OS package distribution system or using setuptools. We currently provide repositories for Ubuntu Trusty (14.04), Ubuntu Xenial (16.04) and CentOS 7. For the remaining OS's please use python's setuptools.

### Installation instructions

Depending on the Linux distribution (Ubuntu or CentOS) you are using, the following commands install and configure the service development kit.

**Ubuntu Trusty (14.04) and Xenial (16.04)**

1. Add the GPG key

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8EC0731023C1F15B
```

2. Add a source entry for the repository

   2.1. Ubuntu Trusty (14.04)

   ```bash
   echo "deb http://repo.sonata-nfv.eu ubuntu-trusty main" | sudo tee -a /etc/apt/sources.list
   ```
   2.2. Ubuntu Xenial (16.04)

   ```bash
   echo "deb http://repo.sonata-nfv.eu ubuntu-xenial main" | sudo tee -a /etc/apt/sources.list
   ```

3. Update and install

```bash
sudo apt-get update
sudo apt-get install sonata-cli
```

**CentOS 7**

- Step 1: Install EPEL

 ```bash
 yum install epel-release
 ```

- Step 2: Create a repository entry file in `/etc/yum.repo.d/sonata.repo` with the following content:

 ```text
 [sonata-repo]
 name=SONATA Repository
 baseurl=http://rpmrepo.sonata-nfv.eu/repo/
 enabled=1
 gpgcheck=0
 ```

- Step 3: Install

 ```
 yum install sonata-cli
 ```

### Installation Videos

-   Ubuntu installation: <https://youtu.be/Hk4j3NcnB4A>
-   CentOS 7 installation: <https://youtu.be/f14ure7YTSY>
-   Setuptools installation: <https://youtu.be/T73prkc7ONI>

### Emulator

SONATA's [emulation platform](https://github.com/sonata-nfv/son-emu) was created to support network service developers to locally prototype and test complete network service chains in realistic end-to-end multi-PoP scenarios. It allows the execution of real network functions, packaged as Docker containers, in emulated network topologies running locally on the network service developer's machine. The emulation platform is based on [Containernet](https://github.com/containernet/containernet).

### Pre-requisites

The emulator requires a Ubuntu 16.04 LTS installation on a bare motel machine or a VM. The following packages need to be installed:

-   ansible
-   aptitude
-   git

### Installation options

There are two ways to install and use son-emu. The simple one is to use [Vagrant] to create a VirtualBox-based VM on your machine that contains the pre-installed and configured emulator. The more complicated, but more flexible, installation is done using an [Ansible] playbook executed on a Ubuntu 16.04 LTS machine or VM as described in the following section.

### Installation instructions

-   Step 1: Install Ansible, etc,

```bash
sudo apt-get install ansible git aptitude
```

-   Step 2: Install Containernet

```bash
cd
git clone https://github.com/containernet/containernet.git
cd ~/containernet/ansible
sudo ansible-playbook -i "localhost," -c local install.yml
```

-   Step 3: Install the Emulator

```bash
cd
git clone https://github.com/sonata-nfv/son-emu.git
cd ~/son-emu/ansible
sudo ansible-playbook -i "localhost," -c local install.yml
```

More details about installation alternatives can be found in the son-emu [GitHub wiki].

### Installation Videos

-   Installation video: [here]
-   Demo video of son-emu year 1 version: [here][1]
-   Demo video that shows son-emu with OSM (**received NetSoft'17 best demo award**): [here][2]
-   Presentation of SDK and son-emu at NFV world congress 2016: [here][3]

  [Vagrant]: https://www.vagrantup.com
  [Ansible]: https://www.ansible.com
  [`https://github.com/containernet/containernet.git`]: https://github.com/containernet/containernet.git
  [`https://github.com/sonata-nfv/son-emu.git`]: https://github.com/sonata-nfv/son-emu.git
  [GitHub wiki]: https://github.com/sonata-nfv/son-emu/wiki/Build-and-installation
  [here]: https://www.youtube.com/watch?v=e6pgP-utSeE
  [1]: https://www.youtube.com/watch?v=cVJpkQ86aTs
  [2]: https://www.youtube.com/watch?v=pFL9wDNOBho
  [3]: https://www.youtube.com/watch?v=ncj2llNZ6qg
