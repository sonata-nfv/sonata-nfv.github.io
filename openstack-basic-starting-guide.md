<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Openstack initial configuration

Immediatly after a fresh Openstack deployment, the default 'admin' project will the only tenant available - as a best practice, you should avoid working on this project, because it gives access to global configuration settings with impact on all the remaining tenants that you'll create. So the first step, as 'admin' Role, will be:

* create a new Project (or Tenant) and define Quotas for this Project

* create one or more Users and assing to the primary Project

* create one or more Groups for that Project and add Users to the Groups - this will simplify the User management by 

* for the initial steps, you don't need to define new Roles to set specific policies

Now that you have a Project (ie, resource isolation), logon to that project (using the new User credentials) and begin the tenant specific configuration, namely:

* create a Public network (to get connectivity to other external networks) and its subnet - NOTE: you are free to create as many Private networks as you need

* create a Router with an interface to the external network

* create an Interface on the Router to the tenant's Public network

After the Public network configuration, you can now connect to other networks on other isolated tenants and even to the Internet. From now, you are able create new VM with its proper key pairs ans security groups.  

## Create a new Project, User and Group

The creation of a new Project requires 'admin' priviledges, so logon as 'admin'.

<< ADMINLOGON.png >>

Create a Project

<< PROJ.png >>

Create User

<< USER.png >>

Create Group

<< GROUP.png >>

## Create a tenant's Public network

The new tenant's networks are created by its User. So logon as a User of that tenant:

Create a Network

<< USERLOGON.png >>

Create a Router

<< ROUT.png >>

Create an Interface 

<< IFACE.png >>

## Create a VM

The Tenant's resources are managed on a self-service basis, but before the creation of your first guest machine be sure that you have the required resources available, namely:

* load or create a public key to use on passwordless VMs

* load the Images to the Image Catalogue (Glance service) - official QCOW2 images with cloud-init already inside are available at [Get Images](https://docs.openstack.org/image-guide/obtain-images.html)

+ create Security Groups (something similar to an Openstack Firewall for youe VM's) to allow protocols and ports per VM

So logon as a User of that tenant:

