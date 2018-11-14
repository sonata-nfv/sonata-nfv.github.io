# SDK + SP
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
 
 
# Openstack -> RDO

For installing Openstack, the easiest way is using the RDO distribution:

https://www.rdoproject.org/install/packstack/


You can also follow these steps:




### Prerrequisites
Functional CentOS VM qith internet connection


### Install all necessary software

sudo
```
 yum install sudo
 ```
python
```
 yum install libselinux-python
 yum update
 ```
pypa
```
 curl https://bootstrap.pypa.io/ez_setup.py | python
 ```
rdo
```
 sudo yum install -y https://www.rdoproject.org/repos/rdo-release.rpm
 sudo yum update -y
 ```
OpenStack packages for RHEL and CentOS
```
 sudo yum install -y centos-release-openstack-pike
 sudo yum update -y
```
###  Download and install packstack 
```
 sudo yum install -y openstack-packstack
 sudo packstack --allinone > /packstack.log
 ```

The installation process can take 1-5 hours depending on internet connection.

In case of error, the packstack.log can be found in /root

### OpenStack credentials
Admin
```
 cat /root/keystonerc_admin
```

### OpenStack provider network

This example shows how to configure a provider network using a physical network to be used by the VMs in openstack. The key is to use openvswitch
to create a bridge that bundles the phyiscal interface and the internal networking of neutron. 

First create the bridge:
```
  ovs-vsctl add-br <bridge name i.e br-ex> 
```

Next we need to add the physical interface to the bridge
```
  ovs-vsctl add-port <bridge i.e. br-ex> <physical interface i.e eth0>
```
Optional: Then we can assign an IP to the bridge in linux to access the neutron node.

Finally we need to map the physical network name of openstack to the bridge. 

```
/etc/neutron/plugins/ml2/openvswich_agent.ini
```
```
  bridge_mappings=<physical network>:<bridge>
```


# Upload VNF images to Openstack

the easiest way to upload your images to Openstack is using the dashboard (Horizon) but also you can do it manually using the Openstack commands or the rest API-



All the info is available here:
Glance Commands:
https://docs.openstack.org/glance/latest/admin/index.html

Rest API:
https://developer.openstack.org/api-ref/image/v2/index.html#images
