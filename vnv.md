# Validation and Verification Platform

The V&V Platform is a mechanism of ensuring that the uploaded services can be tested on the appropriate target Service Platform to ensure that the service is considered fit for purpose. 

## Getting Started With V&V Testing

The outline of theis quickguide for V&V is as follows:

1. Link V&V to a Platform (e.g., SONATA, OSM, ONAP)
1. Upload a Service Package and a Test Package
1. Execute a Test Suite
1. Checking Test Results



### Upload a Service Package and a Test Package

You will need to packages:

- Network Service package [eu.5gtango.test-ns-nsid1v-sonata.0.2.tgo](files/eu.5gtango.test-ns-nsid1v-sonata.0.2.tgo)
- Test package [eu.5gtango.generic-probes-test-pingonly.0.1.tgo](files/eu.5gtango.generic-probes-test-pingonly.0.1.tgo)

For installing them remember to point tng-cli to V&V platform, and type:
'''
tng-cli package -u eu.5gtango.test-ns-nsid1v-sonata.0.2.tgo
tng-cli package -u eu.5gtango.generic-probes-test-pingonly.0.1.tgo
'''


### Creation and execution of a Test Plan

Note that the execution of the test is triggered if the tags in NSD and TD match and the testing tag is present in the package descriptor.   


### Checking Test Results

