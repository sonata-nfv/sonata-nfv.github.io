<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# 5GTANGO Service Platform installation guide

The 5GTANGO system consists of the Service Platform for deploying and orchestrating services and the Service Development Kit to create deployable service packages. For running services, the Service Platform uses the capabilities of a VIM (virtual infrastructure manager), specifically OpenStack. In order to use the Service Platform, you therefore need to have access to a running OpenStack installation.

## Prerequisites

* [Linux ubuntu = 16.04](http://releases.ubuntu.com/16.04/)
* [ansible > 2.4](https://docs.ansible.com/ansible/2.4/intro_installation.html#latest-releases-via-apt-ubuntu)
* [docker > 17.12.0-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
* [docker-py = 1.9.0](https://pypi.org/project/docker/)
* [Git](https://git-scm.com/download/linux)

### Recommended server specs to run SONATA Service Platform

* **Cpu:** 4 cores
* **Ram:** 8 GB
* **Hdd:** 80 GB

### Ansible installation

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

### Docker installation

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

### Python-docker installation

```bash
sudo apt-get install python3 python3-pip pip
pip install docker
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

To use the last stable version of SONATA you need to change the branch to v4.0. That can be performed being inside `tng-devops` folder, with the command:
`git checkout v4.0`

### Creating docker network to allocate the containers

```bash
sudo docker network create tango
```

## Run installation

`sudo ansible-playbook roles/sp.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`

The configuration file of sonata for localhost installation is located in `host_vars/localhost`

```bash
---
## Containers configuration
# Docker Network
docker_network_name: tango

## Version
version: latest
component: all

## Private Docker repository
repository: sonatanfv

# MONITOR pgSQL database

upassword: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          39636466306132653264376131363734643863653439343862623132353566653338653337636631
          6238373234363932346433373732313564643736656639620a336436386165316435646362613365
          65613330636438376363373133363730653065313439353363656466643665613565303934393938
          3535663932386439330a306236653230313836653838333030333337353733633262313764373130
          3233
urootpw: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          65303961626161376638343066646237363661663239393265343933396639343633333139656566
          6335373532393330396233366465376633323539316538650a313433623964656535323363643461
          32346534373166303262383031666230636332633761363263353733326566636639626238363666
          3733613961666430380a663234333765623362393738663731323539616437646237313662313339
          3161

dbname: monitoring
dbuser: monitoringuser

# Ruby env
rack_env : staging

# GATEKEEPER pgSQL database
gtk_db_name: gatekeeper
gtk_db_user: sonatatest
gtk_db_pass: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          63386438636538636637613639366365396639313732643935633038653764393366343566626530
          3665333738653635613863363830656438623933633234310a653434363435656133393562343065
          35623365303237633331386435633138346432616438626532343564366437356338386565326539
          6230366161326462390a333738363030313735323430626130383833396663353064316433363930
          6531

# GATEKEEPER APPLICATION
app_gk_base_url: http://localhost/api/v2

# Infrastructure Abstraction
ia_repo_user: sonatatest
ia_repo_pass: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          33393266393539376535363030336133396161663564306136343166333032663535386132626561
          3436643838643831653739626434333835626466623131640a306434373963646635653032366536
          36373563346137616430376233653139373134366132353930306537306533323535366437383638
          3738663562316432360a666634316566313533366364643965646539636433353736306361396338
          3961

# Monitoring
mon_db_name: monitoring
mon_db_user: monitoringuser
mon_db_pass: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          31343063326138383564633036303164396430663966613434613561343334316563316535373130
          6466616532643030363962366639623531646630386435320a623236353964636239653861333731
          37313336363864363662363866343937656334316563623763646665666237383261333561333163
          3566396637616561660a383363373366646565333631386165653162326366623237636538653761
          3362

clean: false
platform: sp

```
