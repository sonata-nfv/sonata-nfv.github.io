# Quick Start with SONATA

The purpose of this quick start guide is to provide you with a brief overview of the 5GTANGO/SONATA platform and then get you up and running with with this platform in the quickest and easiest way possible.

Here you will find a brief explanation about what SONATA does, how to install it, how to use it and how to get technical support if required.

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/raw/master/images/5gtango-install.png" /></p>

This tutorial is not an exhaustive guide to all features of SONATA, but rather an "umbrella" document that will guide you to the more extensive documentation if required.

### Setup

To setup SONATA you must install the three major components of SONATA and OpenStack in the order shown is the following bulleted list and as highlighted in the following diagram.

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/raw/master/images/5gtango-install-1234.png" /></p>


  * [Installing the SDK](/sdk-installation)
  * [Common installation requirements for SP and V&V](/common-installation)
    * [Installing the Service Platform (SP)](/sp-installation)
    * [Installing the V&V Platform](/vnv-installation)
  * [OpenStack installation (RDO distro)](rdo-install.md)
    * [OpenStack initial configuration](openstack-basic-starting-guide.md)
    * Upload VNF images to Openstack
  * [MicroK8s](/Microk8s-guide-V2.pdf)      
  * [Troubleshooting the Installation](/troubleshooting.md)
  
### Using SONATA

Once the SONATA platform is installed, you can now create network service packages, deploy them and run tests against them!
 
* [Using the SDK](/sdk)
  * [Defining a Network Service (using Descriptors)](/sdk#descriptors-creation)
  * [Validate your SDK Project workspace](/sdk#validation)
  * [Creating Packages](/sdk#package-creation)
  * [Onboarding Packages](/sdk#package-on-boarding)
  
* [Using the Service Platform](/sp)
  * [Prerequisites](/sp#prerequisites)
  * [Instantiating and terminating a Network Service](/sp#instantiating-and-terminating-a-network-service)
  * [Service Check](/sp#service-check)

* [Using the V&V Platform](/vnv)
  * [Link V&V to a Platform ](/vnv#link-vv-to-a-platform)
  * [Upload a Service Package and a Test Package](/vnv#upload-a-service-package-and-a-test-package)
  * [Creation and execution of a Test Plan](/vnv#creation-and-execution-of-a-test-plan)
  * [Checking Test Results](/vnv#checking-test-results)

### Contributing to SONATA

To contribute to the development of a SONATA component you have to fork the repository, commit new code and create pull requests.

### Support

You can find [troubleshooting documentation](https://sonata-nfv.github.io/troubleshooting.html).

You may use the sonata-dev mailing list: sonata-dev(at)lists.atosresearch.eu

You may use the GitHub issues to report bugs (per component). For example, tng-vnv-planner component can be found at: [https://github.com/sonata-nfv/tng-vnv-planner/issues](https://github.com/sonata-nfv/tng-vnv-planner/issues).

