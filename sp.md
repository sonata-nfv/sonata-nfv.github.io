# Service Platform

With the installation of the Service Platform ready and the Descriptors already created is time to deploy our network service. To this end, you will need to fulfill a set of prerequisited described below.

## Prerequisites

1. VNF images available in Openstack:
   
   Check that the images are available in openstack if not you can upload these two images:

   a. [squid](http://bit.ly/5GTANGO_squid)

   b. [haproxy](http://bit.ly/5GTANGO_HAproxy)

2. Network service descriptor on-boarded to the Service Platform:
   
   Check if the Package is available in the service plaform. It can be done with the command: `curl http://<service_platform_ip>/api/v3/packages`. If the Network Service is not avaible then you can on-board using this command:
  
   `curl -X POST http://<service_platform_ip>/api/v3/packages -F "package=@./eu.5gtango.ns-squid-haproxy.0.1.tgo" -H 'content-type:multipart/form-data`.

   The package used in this guide is availabe in [here](files/eu.5gtango.ns-squid-haproxy.0.1.tgo)

3. VIM configured in the Service Platform:

   After the installation of the SP, you need to attach a VIM. You can use [this](https://raw.githubusercontent.com/sonata-nfv/sonata-nfv.github.io/master/vim_script.sh) bash script to perform this task. To customize the configuration you will need to edit the script and modify the variables.

```bash
#!/bin/bash
user="username"
password="password"
tenant="tenantname"
vim_ip="000.000.000.000"
router="tenant router uuid"
ext_net="external net uuid"
city="city"
country="country"
name="vimname"
```

To get the tenant router uuid you can go to openstack horizon dashboard and open the route: `project -> network -> routers -> (select your router) -> Overview -> ID`

<p align="center"><img src="images/router-uuid.png" width="70%" /></p>



# Service deployment


### Login to 5GTANGO Service Platform

Write the url (ip) of your service platform in any browser and you will be redirected to GUI's main dashboard:

<p align="center"><img src="images/dashboard.jpg" /></p>


In the SP you can configure the Services, the Functions and the Network Slices


Here is where you can work with your Network Services. You can deploy, check the status and terminate them:

<p align="center"><img src="images/sm.jpg" /></p>






### Instantiating and terminating a Network Service 

-   Step 1: Login and verify that the selected section is “Available Network Services” inside the Service Management. Here you can see the green play button. After pressing it the instantiation process will begin.

<p align="center"><img src="images/instantiate.jpg" /></p>


-   Step 2: In the section is “Network Services Instances” inside the Service Management. Here you can see the red stop button. After pressing it the terminate process will begin.

<p align="center"><img src="images/terminate.jpg" /></p>



# Service Check

In the Dashboard, in the Network Service tab, you can check the status of the instantiated services.

<p align="center"><img src="images/sp.jpg" /></p>
