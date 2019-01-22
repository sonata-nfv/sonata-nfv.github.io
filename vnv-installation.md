<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# 5GTANGO VnV Platform installation guide

The 5GTANGO Vnv is wide configurable and easy to install. After the preparation of the system described in the section [common installation](/common-installation.md), the following steps would guide you to configure and finish the installation of the VnV Platform.

## Run installation

To install SONATA VnV Platform, a set of ansible scripts were developed in order to automate the installation. You will need a SONATA SP available previously VnV installation since the SP attaching is done during the installation of VnV. The command to install the SP is the following:

`sudo ansible-playbook roles/vnv.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`

In order to customize the installation you can modify the variables for the target destination. In the case described in the command below was localhost. The configuration file of sonata for localhost installation is located in `host_vars/localhost`

```bash
---
## Containers configuration
# Docker Network
docker_network_name: tango

## Version
version: dev

component: all

## Docker repository
repository: sonatanfv

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

clean: false
platform: vnv

## VnV Specific Variables
## Please replace ip-of-sp by the IP address of the service platform
app_gk_base_url: http://ip-of-sp:32002/api/v3
app_vnv_logging_level: DEBUG
app_gk_base_url: http://ip-of-sp:32002/api/v3
routes_file: vnv_routes.yml
unpackager_url: http://ip-of-sp:5099/api/v1/packages
catalogue_url: http://ip-of-sp:4011/catalogues/api/v2
repository_url: http://tng-rep:4012
external_callback_url: http://tng-vnv-lcm:6100/api/v1/packages/on-change
internal_callback_url: http://tng-vnv-lcm:6100/api/v1/packages/on-change

```

Please bear in mind you will need to replace ip-of-sp in the file by the IP address of the Service Platform to be used by the VnV