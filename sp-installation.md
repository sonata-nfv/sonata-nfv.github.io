<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Installing the Service Platform 

The Service Platform is relatively straightforward to install. After the initial preparation of the system described in the [common installation](/common-installation.md) section, the following steps will guide you to configure and finish the installation of the Service Platform.

## Installing SP using Ansible

A set of ansible scripts were developed in order to automate the installation. The command to install the SP is the following:

`sudo ansible-playbook roles/sp.yml -i environments -e target=localhost --ask-vault-pass`

Password is: `sonata`

Note: Please ensure you are in the 'tng-devops' folder that you created in the in the [common installation](/common-installation.md) section

In order to customize the installation you need to modify the variables for the target destination. In the case described in the command below the target destination is set to 'localhost'. The configuration file of SP for localhost installation is located in [host_vars/localhost](https://github.com/sonata-nfv/tng-devops/blob/master/host_vars/localhost).


## Verifying the installation

Check the availability of the SP portal at: [http://localhost/](https://localhost/). You will need to create an account with login/password, before continuing.

You can follow next guide about [Service Platform usage](sp.md).
