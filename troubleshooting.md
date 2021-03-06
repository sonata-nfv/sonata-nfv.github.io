# Troubleshooting your 5GTANGO Installation

[apple]: https://maxcdn.icons8.com/Android_L/PNG/24/Operating_Systems/mac_os-24.png 'Apple'
[linux]: https://maxcdn.icons8.com/Color/PNG/24/Operating_Systems/linux-24.png 'Linux'
[windows10]: https://maxcdn.icons8.com/Color/PNG/24/Operating_Systems/windows8_copyrighted-24.png 'Windows8'

![Apple][apple] means that a workaround needed **on _macOS_**.<br />
![Linux][linux] means that a workaround needed **on _Linux_**.<br />
![Windows 10][windows10] means that a workaround needed **on _Windows_**.<br />

The following are some of the problems commonly encountered during installation:

* [Python - virtualenv not found] (/troubleshooting#)
* Installation in Ubuntu 18.04
* [Installing the SDK](/sdk-installation)       
* Ansible/Docker  - container deploy problem due to wrong python interpreter

### Virtualenv Issues ![Apple][apple] ![Linux][linux] ![Windows 10][windows10]

https://stackoverflow.com/questions/39964635/error-virtualenv-command-not-found-but-install-location-is-in-pythonpath?noredirect=1&lq=1

Alternative: try to install virtualenv with 'sudo pip3 install virtualenv'

### Installation in Ubuntu 18.04
ASCIINEMA of VNV deployment to Ubuntu 18.04

'''
$ sudo apt install asciinema
$ wget https://cld.pt/dl/download/d8f17ed2-755d-4b09-a85b-3eeec2edc5dc/u18sp-deploy.cast
$ asciinema play u18sp-deploy.cast
'''

### Ansible Issues ![Linux][linux]

#### Failed to import docker or docker-py 

```
TASK [sp : deploy a PostgreSQL database server as a Container] *****************
fatal: [localhost]: FAILED! => {"changed": false, "msg": "Failed to import docker or docker-py - No module named requests.exceptions. Try \`pip install docker\` or \`pip install docker-py\` (Python 2.6)"}
    to retry, use: --limit @/home/kwx420965/5gtango/tng-devops/roles/sp.retry
```

If you encounter errors like the above when executing the V&V ansible playbook e, then please try undeploying docker-py from pip3 using the following commands.

```
$ pip3 uninstall docker-py
```

then

```
$ pip3 install docker-py
```

### Verify Environment before Installation

#### Check Ubuntu is 16.04

```
$ lsb_release -a
```

Should return the following

```
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 16.04.5 LTS
Release:	16.04
Codename:	xenial
```

## Troubleshooting your running 5GTANGO Platform

### Verify that V&V is running

```shell
$ docker inspect -f '{{.State.Running}}' tng-gtk-vnv
$ docker inspect -f '{{.State.Running}}' tng-vnv-lcm
$ docker inspect -f '{{.State.Running}}' tng-vnv-tee
$ docker inspect -f '{{.State.Running}}' tng-vnv-platform-adapter
```

## Reconfigure the VIM

If you need to change the VIM info or reconfigure it, first you need to clear the previous info deom the DB, You can do it with these commands:

```shell
$ sudo docker exec -t son-postgres psql -h localhost -U sonatatest -d vimregistry -c "DELETE FROM VIM *"
$ sudo docker exec -t son-postgres psql -h localhost -U sonatatest -d vimregistry -c "DELETE FROM LINK_VIM *"
$ sudo docker exec -t son-postgres psql -h localhost -U postgres -d wimregistry -c "DELETE FROM ATTACHED_VIM *"
$ sudo docker exec -t son-postgres psql -h localhost -U postgres -d wimregistry -c "DELETE FROM WIM *"
$ sudo docker restart son-sp-infrabstract
$ sudo docker restart wim-adaptor
```

## Cleaning the system

In case you want to clean the system for any reason (re-install for example), you can use these commands, that will delete all the dockers, the images, the docker network and tne files where resides persistent storage of all DBs:

```shell
$ sudo docker stop $(sudo docker ps -aq)
$ sudo docker rm $(sudo docker ps -aq)
$ sudo docker rmi $(sudo docker images -a -q)
$ docker network rm tango
$ sudo rm -rf /etc/sonata
```

And for reinstalling we recommend to mark as 'true' the variable "clean· in the file /tng-devops/host_vars/localhost
