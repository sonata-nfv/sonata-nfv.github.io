# Troubleshooting your 5GTANGO Installation

[apple]: https://maxcdn.icons8.com/Android_L/PNG/24/Operating_Systems/mac_os-24.png 'Apple'
[linux]: https://maxcdn.icons8.com/Color/PNG/24/Operating_Systems/linux-24.png 'Linux'
[windows10]: https://maxcdn.icons8.com/Color/PNG/24/Operating_Systems/windows8_copyrighted-24.png 'Windows8'

![Apple][apple] means that a workaround needed **on _macOS_**.<br />
![Linux][linux] means that a workaround needed **on _Linux_**.<br />
![Windows 10][windows10] means that a workaround needed **on _Windows_**.<br />

The following are some of the problems commonly encountered during installation:

* [Python - virtualenv not found] (/troubleshooting#)
* [Installing the SDK](/sdk-installation)       
* Ansible/Docker  - container deploy problem due to wrong python interpreter


### Virtualenv Issues ![Apple][apple] ![Linux][linux] ![Windows 10][windows10]

https://stackoverflow.com/questions/39964635/error-virtualenv-command-not-found-but-install-location-is-in-pythonpath?noredirect=1&lq=1

Alternative: try to install virtualenv with 'sudo pip3 install virtualenv'


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