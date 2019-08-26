<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Common installation requirements for SP and V&V

The 5GTANGO system consists of the Service Platform for deploying and orchestrating services and the Service Development Kit to create deployable service packages. Between the service development and Production, we have a tool for Validate and Verify the Network Service. This tool is called V&V and helps developers to create a set of tests and execute them against network services. 

## Prerequisites

* [Linux Ubuntu = 16.04](http://releases.ubuntu.com/16.04/)
* [ansible > 2.4](https://docs.ansible.com/ansible/2.4/intro_installation.html#latest-releases-via-apt-ubuntu)
* [docker > 17.12.0-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
* [docker-py = 1.9.0](https://pypi.org/project/docker/)
* [git](https://git-scm.com/download/linux)

### Recommended server specs to run SONATA Service Platform

* **CPU:** 4 cores
* **Memory:** 8 GB
* **Disk:** 80 GB

### Installing Ansible

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

### Installing Docker

```bash
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
```

### Installing python and docker using pip

```bash
sudo apt-get install python3 python3-pip -y
pip3 install docker
```

[In case of this error](https://stackoverflow.com/questions/14547631/python-locale-error-unsupported-locale-setting)

```bash
"Traceback (most recent call last):
  File "/usr/bin/pip3", line 11, in <module>
    sys.exit(main())
  File "/usr/lib/python3/dist-packages/pip/__init__.py", line 215, in main
    locale.setlocale(locale.LC_ALL, '')
  File "/usr/lib/python3.5/locale.py", line 594, in setlocale
    return _setlocale(category, locale)
locale.Error: unsupported locale setting
"
```

It can be fixed with:

```bash
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales
```

### Extra dependencies

```bash
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
pip3 install ansible
```

### Git installation

```bash
sudo apt-get install git
```

### Cloning the tng-devops repository

```bash
git clone https://github.com/sonata-nfv/tng-devops.git
cd tng-devops/
```

## SONATA Installation

To use the latest stable version of SONATA you will need to change the branch to _v5.0_. This can be performed from inside the `tng-devops` folder, with the command:
`git checkout v5.0`

### Creating docker network to allocate the containers

```bash
sudo docker network create tango
```

### Follow-up installation
You are NOW ready to install SONATA Service Platform OR V&V Platform:

* [Installing the Service Platform (SP)](/sp-installation)
* [Installing the V&V Platform](/vnv-installation)
