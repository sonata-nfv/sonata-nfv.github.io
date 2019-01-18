<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# 5GTANGO Validation & Verification Platform installation guide

The 5GTANGO system consists the Service Platform (SP), the Service Development Kit (SDK) and the Validation and Verification platform (V&V). The V&V Platform is responsible for validation and the verification of services with given tests. The SP provides the mechanism for deploying and orchestrating services. The Service Development Kit is the toolbox to create deployable service and test packages. <s>For running services, the Service Platform uses the capabilities of a VIM (virtual infrastructure manager), specifically OpenStack. In order to use the Service Platform, you therefore need to have access to a running OpenStack installation.</s>

## Prerequisites

* [Linux ubuntu = 16.04](http://releases.ubuntu.com/16.04/)
<s>* [ansible > 2.4](https://docs.ansible.com/ansible/2.4/intro_installation.html#latest-releases-via-apt-ubuntu)</s>
* [docker > 17.12.0-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
<s>* [docker-py = 1.9.0](https://pypi.org/project/docker/)</s
* [Git](https://git-scm.com/download/linux)

### Recommended server specs to run SONATA Service Platform

* **Cpu:** 4? cores
* **Ram:** 8? GB
* **Hdd:** 80? GB
