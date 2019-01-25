<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# 5GTANGO VnV Platform installation guide

After the initial preparation of the system described in the [common installation](/common-installation.md) section, the following steps will guide you to configure and finish the installation of the VnV Platform.

## Installing V&V Platform using Ansible

A set of ansible scripts were developed in order to automate the installation. You will need a SONATA SP available previously VnV installation since the SP attaching is done during the installation of VnV. The command to install the SP is the following:

`sudo ansible-playbook roles/vnv.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`
Note: Please ensure you are in the 'tng-devops' folder that you created in the in the [common installation](/common-installation.md) section.

In order to customize the installation you can modify the variables for the target destination. In the case described in the command below was localhost. The configuration file of sonata for localhost installation is located in `host_vars/localhost`.

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


```bash
Please bear in mind you will need to replace ip-of-sp in the file with the IP address of the Service Platform to be used by the VnV

TASK [vnv : Installation Starts] ***********************************************
ok: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### SP MONGODB DEPLOYMENT 20190125-140524"
}

TASK [vnv : deploy MongoDB as a Container (used by Monitory)] ******************
changed: [localhost]

TASK [vnv : Wait until the string "Mongodb" is UP] *****************************
ok: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### VnV Lifecycle Manager Deployment 20190125-140555"
}

TASK [vnv : VnV LCM - running Docker containers] *******************************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### VnV Test Execution Engine Deployment 20190125-140645"
}

TASK [vnv : VnV TEE - running Docker containers] *******************************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### SP Catalogue DEPLOYMENT 20190125-140653"
}

TASK [vnv : deploy Catalogues as a Docker container (from the Registry to the SP VM appliance)] ***
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### SP REPOs DEPLOYMENT 20190125-140735"
}

TASK [vnv : deploy REPOSITORIES as a Docker container (from the Registry to the SP VM appliance)] ***
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### 5GTANGO GTK-COMMON DEPLOYMENT 20190125-140743"
}

TASK [vnv : run the 5GTANGO GTK-COMMON] ****************************************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### 5GTANGO GTK-VNV DEPLOYMENT 20190125-140812"
}

TASK [vnv : run the 5GTANGO GTK-VNV] *******************************************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### 5GTANGO SEC-GTW DEPLOYMENT 20190125-140835"
}

TASK [vnv : run the 5GTANGO Security Gateway] **********************************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### 5GTANGO API-GTW DEPLOYMENT 20190125-140847"
}

TASK [vnv : run the 5GTANGO Security Gateway] **********************************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### SP TNG-SDK-PACKAGE DEPLOYMENT 20190125-140856"
}

TASK [vnv : TNG-SDK-PACKAGE (tng-sdk-package) (Docker container)] **************
changed: [localhost]

TASK [vnv : debug] *************************************************************
ok: [localhost] => {
    "msg": "##### 5GTANGO PORTAL DEPLOYMENT 20190125-140910"
}

TASK [vnv : 5GTANGO PORTAL - running Docker containers] ************************
changed: [localhost]

TASK [vnv : Installation Finish] ***********************************************
ok: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=25   changed=11   unreachable=0    failed=0
```
