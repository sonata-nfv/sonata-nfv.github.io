<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Openstack installation guide

Redhat Openstack Deployment (RDO) is one of the quickest and easiest methods to deploy Openstack to a single bare metal server and is fully explained here: [how to spin up a proof of concept cloud on one node, using the Packstack installation utility](http://rdoproject.org/install/packstack/) - on January 2019 the latest Openstack release delivered is Rocky. 

For an entry level scenario, a bare metal server with 4 to 8 cores (with virtualization enabled at the server's BIOS), 16GB of memory and 80GB of disk would be the minimum hardware requirements to instantiate a few VM's of low resource consumption flavors.

Before start running the 'packstack' tool, be sure to allocate a network segment (ex, one C-class) with your network administrator: it will be the 'provider' network used by the VM's instantiated on the Openstack.

Assuming that you have a C-class IP address space then, instead of running the last command `# packstack --allinone`, you must run:

```bash
# packstack --allinone --provision-demo=n --os-neutron-ovs-bridge-mappings=extnet:br-ex --os-neutron-ovs-bridge-interfaces=br-ex:eth0 --os-neutron-ml2-type-drivers=vxlan,flat
```
as explained here: [how to use 'packstack –allinone' with an existing external network](http://rdoproject.org/networking/neutron-with-existing-external-network/)

This will define an external network named 'extnet' attached to the OVS bridge called 'br-ex' connected to the 'eth0' physical interface. The tenant networks will be isolated via VxLAN tunneling. 

The deployment process will end in less than 1 hour, depending on the server performance. at the end it will present the URL of the Openstack dashboard and the 'admin' credentials to connect.

NOTE: if you do not have a bare metal server available, you can deploy RDO to a single RHEL or CentOS virtual machine but you must be aware of the performance penalities of a scenario like this.
