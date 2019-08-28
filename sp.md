# Service Platform

With the installation of the Service Platform ready and the Descriptors already created is time to deploy our network service. To this end, you will need to fulfill a set of prerequisited described below.

## Prerequisites

1. VNF images available in Openstack:
   
   Check that the images are available in openstack if not you can upload these two images:

   a. [squid](http://bit.ly/5GTANGO_squid)

   b. [haproxy](http://bit.ly/5GTANGO_HAproxy)

2. VIM configured in the Service Platform:

   After the installation of the SP, you need to attach a VIM. You need to login in the Service Platform and select Settings/VIM, as shown in the following figure.
<p align="center"><img src="images/vim_setup.png" width="70%" /></p>

To get the tenant router uuid you can go to openstack horizon dashboard and open the route: `project -> network -> routers -> (select your router) -> Overview -> ID`

<p align="center"><img src="images/router-uuid.png" width="70%" /></p>

To get the external network uuid you can go to openstack horizon dashboard and open the route: `project -> network -> network -> (select your external net) -> Overview -> ID`

<p align="center"><img src="images/network-extnet-uuid.png" width="70%" /></p>

3. Check if the user have primary project assigned.

<p align="center"><img src="images/primary-project.png" width="70%" /></p>

If not assign one at the end of the list in the menu.

<p align="center"><img src="images/primary-project-s.png" width="50%" /></p>

After the configuration in the Openstack, you can run the script with the command: `bash vim_script.sh`

4. Network service descriptor on-boarded to the Service Platform:
   
   Check if the Package is available in the service plaform. It can be done with the command: `curl http://<service_platform_ip>/api/v3/packages`. If the Network Service is not avaible then you can on-board using this command:
  
   `curl -X POST http://<service_platform_ip>/api/v3/packages -F "package=@./eu.5gtango.ns-squid-haproxy.0.1.tgo" -H 'content-type:multipart/form-data`.

   The package used in this guide is availabe in [here](files/eu.5gtango.ns-squid-haproxy.0.1.tgo)

## Instantiating and terminating a Network Service

- **Step 1:** Open the 5GTANGO portal in `http://<service_platform_ip>/` and go to `Service Management -> Available network services`. In this screen you can see the list of available network services and you could instantate it pushing the green play button.

<p align="center"><img src="images/available-network-services.png" width="80%" /></p>

- **Step 2:** Select the service you desire to instantiate and press the green play button. Next, you will get a window that you can skip for now about ingress and egress networks. You can clic on Next button.

<p align="center"><img src="images/ingress-egress.png" width="50%" /></p>

- **Step 3:** Write a name for your network service and don't select any SLA for now, the SLA part will be covered in the further guides. To instantiate the NS just click on INSTANTIATE button and the service will be instantiated inmediately.
  
<p align="center"><img src="images/instance-name.png" width="70%" /></p>

## Service Check

In the Dashboard, in the Service Management tab, you can check the status of the instantiated services.

Here you can see and select a service to instantiate it:

<p align="center"><img src="images/avalns.jpg" width="90%" /></p>


Once launched, you can see the status of the instantiation operation in the requests tab:

<p align="center"><img src="images/requests.jpg" width="90%" /></p>

Finally, you can see you instances:

<p align="center"><img src="images/instances.jpg" width="90%" /></p>
