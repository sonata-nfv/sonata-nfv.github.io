<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# 5GTANGO VnV Platform installation guide

After the initial preparation of the system described in the [common installation](/common-installation.md) section, the following steps will guide you to configure and finish the installation of the VnV Platform.

## Installing V&V Platform using Ansible

Note: Please ensure you are in the 'tng-devops' folder that you created in the in the [common installation](/common-installation.md) section.

In order to customize the installation you can modify the variables for the target destination. In the case described in the command below was localhost. The configuration file of sonata for localhost installation is located in [host_vars/localhost](https://github.com/sonata-nfv/tng-devops/blob/master/host_vars/localhost).

Please bear in mind you will need to **replace platform: sp** in the file [host_vars/localhost](https://github.com/sonata-nfv/tng-devops/blob/master/host_vars/localhost) and **write platform: vnv**.

A set of ansible scripts were developed in order to automate the installation. You will need a SONATA SP available previously VnV installation since the SP attaching is done during the installation of VnV. The command to install the VnV is the following:

`sudo ansible-playbook roles/vnv.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`


## Verifying the installation

Check the availability of the V&V portal at: [http://localhost/](https://localhost/). You will need to create an account with login/password, before continuing. You can use the default login/password: admin/tango

You can follow next guide about [V&V Platform usage](vnv.md).


