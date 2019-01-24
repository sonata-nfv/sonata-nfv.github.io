<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Openstack initial configuration

Immediatly after a fresh Openstack deployment, the default `admin` project will the only tenant available - as a best practice, you should avoid working on this project, because it gives access to global configuration settings with impact on all the remaining tenants that you'll create. So the first step, as `admin` Role, will be:

* create a new Project (or Tenant) and define Quotas for this Project

* create one or more Users and assing to the primary Project

* create one or more Groups for that Project and add Users to the Groups - this will simplify the User management by 

* for the initial steps, you don't need to define new Roles to set specific policies

Now that you have a Project (ie, resource isolation), logon to that project (using the new User credentials) and begin the tenant specific configuration, namely:

* create a Public network (to get connectivity to other external networks) and its subnet

* create a Router with an interface to the external network

* create an Interface on the Router to the tenant's Public network

After the Public network configuration, you can now connect to other networks on other isolated tenants and even to the Internet. From now, you are able create new VM with its proper key pairs ans security groups.  

## Create a new Project, User and Group

The creation of a new Project requires `admin` priviledges, so logon as `admin`.

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-logon.png" /></p>

### Create a Project

`Identity --> Project --> + Create Project`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-project-create.png" /></p>

And set the quotas for this tenant:

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-project-quota.png" /></p>

Later you can change the quota limits by setting new values for the tenant's quota:

`Identity --> Project --> Edit Project --> Modify Quotas`


### Create User

`Identity --> User --> + Create User`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-user-create.png" /></p>

### Create Group

`Identity --> Group --> + Create Group`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-group-create.png" /></p>

#### Add a User to the Group

`Identity --> Group --> + Add User`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-group-adduser.png" /></p>


## Manage the tenant's resources

The tenants resources like VM, Networks and Storage are managed by the tentant's User on a self-service basis. The initial logon will looks like:

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-user-initial-login.png" /></p>

### Configure the connectivity to the External networks
 
The tenant resources are instantiated in an isolated environment. To get access to the external networks, you must create a Public network for this tenant.

#### Create a Network

`Project --> Network --> Networks --> + Create Networks`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-network-create.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-subnet-create.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-subnet-create-details.png" /></p>

#### Create a Router

`Project --> Network --> Networks --> + Create Router`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-router-create.png" /></p>

#### Create an Interface

`Project --> Network --> Networks --> + Create Router --> select the new Router --> Interfaces --> + Add Interface`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-router-addinterface.png" /></p>

That's it! You have now connectivity to the external networks has show in the next image. Note that you can create as many private networks as you like, depending on the topology of the Network Service.

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-network-topology.png" /></p>


### Create a VM

Before the creation of your first guest machine be sure that you have the required resources available, namely:

* load or create a public key to use on passwordless VMs

* upload the Images to the Image Catalogue (Glance service) - official QCOW2 tree/master/images/opnstk with cloud-init already inside are available at [Get Images](https://docs.openstack.org/image-guide/obtain-tree/master/images/opnstk.html)

+ create Security Groups (something similar to an Openstack Firewall for youe VM's) to allow protocols and ports per VM


#### Import your public Key of your personal key pair

`Project --> Compute --> Key Pairs --> Import Public Key`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-importpublickey.png" /></p>


#### Upload a new Image to the Catalogue

`Project --> Compute --> Images --> + Create Image`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-imagecreate.png" /></p>


#### Create a Security Group

`Project --> Network --> Security Group --> + Create Security Group`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-securitygroup.png" /></p>

Then, add rules to the Security Group:

`Project --> Network --> Security Group --> select the new Security Group --> Manage Rules --> + Add Rule`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-addrule.png" /></p>


#### Create a VM

`Project --> Compute --> Instances --> Launch Instance`

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-launchinstance.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-01details.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-02source.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-03flavor.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-04networks.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-05networkports.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io//tree/master/images/opnstk/1st-steps-06securitygroups.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-07keypair.png" /></p>

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/tree/master/images/opnstk/1st-steps-08config.png" /></p>

