# Quick Start with 5GTANGO

The purpose of this quick start guide is to provide you with a brief overview of the 5GTANGO/SONATA platform and then get you up and running with with this platform in the quickest and easiest way possible.

Here you will find a brief explanation about what 5GTANGO does, how to install it, how to use it and how to get technical support if required.

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/raw/master/images/5gtango-install.png" /></p>

This tutorial is not an exhaustive guide to all features of 5GTANGO, but rather an "umbrella" document that will guide you to the more extensive documentation if required.

### Setup

To setup 5GTANGO you must install the three major components of 5GTANGO and OpenStack in the order shown is the following bulleted list and as highlighted in the following diagram.

<p align="center"><img src="https://github.com/sonata-nfv/sonata-nfv.github.io/raw/master/images/5gtango-install-1234.png" /></p>


  * [Installing the SDK](/sdk-installation)
  * [Common installation requirements for SP and V&V](/common-installation)
    * [Installing the Service Platform (SP)](/sp-installation)
    * [Installing the V&V Platform](/vnv-installation)
  * [ÒpenStack installation (RDO distro)](rdo-install.md)
    * [OpenStack initial configuration](openstack-basic-starting-guide.md)
  * Upload VNF images to Openstack
  * [Troubleshooting the Installation](/troubleshooting.md)
  
### Using 5GTANGO

Once the 5GTANGO platform is installed, you can now create network service packages, deploy them and run tests against them!
 
* [Using the SDK](/sdk)
  * [Defining a Network Service (using Descriptors)](/sdk#descriptors-creation)
  * [Validate your SDK Project workspace](/sdk#validation)
  * [Creating Packages](/sdk#package-creation)
  * [Onboarding Packages](/sdk#package-on-boarding)
  
* [Using the Service Platform](/sp)
  * [Prerequisites](/sp#prerequisites)
  * [Instantiating and terminating a Network Service](/sp#instantiating-and-terminating-a-network-service)
  * [Service Check](/sp#service-check)

* [Using the V&V Platform](/vnv.md)
  * [Prerequisites](/vnv.md#prerequisites)
  * [Uploading a Service Package](/vnv.md#uploading-a-service-package)
  * [Uploading a Test Package](/vnv.md#uploading-a-service-package)
  * [Tagging Tests for a given Network Service](/vnv.md#tagging-tests-for-a-given-network-service)
  * [Uploading a Test Package with a specific Test Tag](/vnv.md#uploading-a-test-package-with-a-specific-test-tag)
  * [Execute a Test Suite](/vnv.md#execute-a-test-suite) 
  * [Checking Test Results](/vnv.md#checking-test-results) 
  * [Working with the API](/vnv.md#working-with-the-API)  

### Examples
  * [Network Slicing](/slicing)