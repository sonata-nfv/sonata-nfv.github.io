<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Installing the Service Platform 

The Service Platform is relatively straightforward to install. After the initial preparation of the system described in the [common installation](/common-installation.md) section, the following steps will guide you to configure and finish the installation of the Service Platform.

## Installing SP using Ansible

A set of ansible scripts were developed in order to automate the installation. The command to install the SP is the following:

`sudo ansible-playbook roles/sp.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`

Note: Please ensure you are in the 'tng-devops' folder that you created in the in the [common installation](/common-installation.md) section

In order to customize the installation you need to modify the variables for the target destination. In the case described in the command below the target destination is set to 'localhost'. The configuration file of SP for localhost installation is located in `host_vars/localhost`.

```bash
---
## Containers configuration
# Docker Network
docker_network_name: tango

## Version
version: dev
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


### Verifying the installation