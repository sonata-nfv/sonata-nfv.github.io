---
layout: default
title: Overview of Component Installation 
---

# Installation

## General instructions and main steps

The SONATA system consists of the Service Platform for deploying and orchestrating services and the Service Development Kit to create deployable service packages. For running services, the Service Platform uses the capabilities of a VIM (virtual infrastructure manager), specifically OpenStack. In order to use the Service Platform, you therefore need to have access to a running OpenStack installation.

In general, the main steps to install a working SONATA system are as follows:

1.  Install the Service Platform (see 4.2).
2.  Install the Service Development Kit (see 4.3).
3.  Install the Emulator for testing purposes (see 4.4).
4.  Install OpenStack (or get access to an existing installation).
5.  Connect the Service Platform to OpenStack (see 5.5.2).

Afterwards, you are ready to create your own services (or acquire existing ones), and deploy them with your Service Platform. This is described in section 5.

## Service Platform installation

### Pre-requisites

**Hardware:**

-   Minimal size requirements
    -   Memory 4GB RAM
    -   CPU 1vCPU
    -   Disk 25GB
-   Recommended size requirements
    -   Memory 8GB
    -   CPU 4vCPU
    -   Disk 80GB

**Software:**

-   Ansible 2.3.0+
-   Git
-   Docker CE 17.06

### Installation options

**Default Installation**

To install SONATA Service Platform v3.0 you only need to follow the steps described above taking into account that the configuration will be the following:

-   Ansible target: -&gt; Localhost
-   The public IP is the IP in the ipv4 interface card. It is used to access the GUI, BSS and the Gatekeeper API

**Custom Installation**

For custom installation, a configuration file is available in the folder: \`group\_vars/sp/vault.yml\`

This file is encrypted. To open it, the password should be located \`~/.ssh/.vault\_pass\`. The default password is \`sonata\`.

To edit the encrypted file you can use the following command: \`ansible-vault edit group\_vars/sp/vault.yml\`

```
# VARs for MONITOR pgSQL database
upassword: sonata
urootpw: 1234
dbname: monitoring
dbuser: monitoringuser
# VARs for GATEKEEPER pgSQL database
gtk_db_name: gatekeeper
gtk_db_user: sonatatest
gtk_db_pass: sonata
# VARs for GATEKEEPER USER MGMT
gtk_keycloak_user: admin
gtk_keycloak_pass: admin
# VARs for IA
ia_repo_user: sonatatest
ia_repo_pass: sonata
#VARs for Monitoring
mon_db_name: monitoring
mon_db_user: monitoringuser
mon_db_pass: sonata
```

To change the default configuration of installation, the following file can be edited: `roles/sp/defaults/main.yml`

```
---
######################
# defaults file for sp
######################
nbofvms: 1
pop: alabs
proj: demo
distro: xenial
plat: sp
########################
# Docker network segment
########################
# Docker network name
docker_network_name: son-sp
#############################################
# SONATA 5G NFV SP specific version variables
#############################################
# SONATA SP Version. This installer was created to deploy version 2.1
sp_ver: 3.0
# SONATA SP Hostname. Default Public IP address
plat_hostname: "Template:Public ip"
# SONATA SP Domain Name. Default Public IP address
domain_name: "Template:Public ip"
# SONATA SP fqdn. Default Public IP address
fqdn: "Template:Public ip"
# SONATA SP User created by son-install
sp_user: sonata
sp_pass: "$1$SRc2ws2Z$rSdCC/UKiatagNdfsTVuf0"
```



### Installation instructions

-   On a clean Ubuntu 16.04 installation

```
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get install -y git
git clone https://github.com/sonata-nfv/son-install.git
cd son-install
echo sonata | tee ~/.ssh/.vault_pass
ansible-playbook utils/deploy/sp.yml -e "target=localhost public_ip=<your_ip4_address>" -v
```
  
  

### Installation Videos

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
