# Validation and Verification Platform

The V&V Platform is a mechanism of ensuring that the uploaded services can be tested on the appropriate target Service Platform to ensure that the service is considered fit for purpose. 

The V&V Platform is responsible for the following workflow: 
1. Identify appropriate tests (using tags) for the target service,
1. Prepare the target service platform and corresponding test environment,
1. Execute the sequence of tests via a test plan on the target service platform,
1. Determine the success or failure of the test
1. Publish the results for further analysis.

The V&V manages the following _artifacts_ through the test lifecycle:
1. uploading of a _network service_ (in a package), 
1. and corresponding suite of _tests_ (test package), 
1. analysis of the _test metadata_ to ensure that the correct tests are applied to that network service,
1. ensuring the setup, execution of the tests, and the _environment_ clean-up,
1.  and finally, the publication of the _test results_. 

The tests are executed from the V&V platform in a sandboxed environment operating under the V&V platform control, so that functional and non-functional metrics are obtained, thus leading to the verification and validation of the network service under test.

## Getting Started With V&V Testing

The outline of the tasks to perform in V&V is as follows:
1. Create 1 Service Package and 1 Test Package
1. Upload a Service Package and a Test Package
1. Execute a Test Suite
1. Checking Test Results
1. Working with the V&V API


#### Prerequisites

Before you can try out V&V functionality you will need the following:
1. A valid Network Service Package created by the SDK:  
1. A valid Test Package created by the SDK:
1. A V&V instance that is configured and integrated with a running Service Platform instance:


#### Schemas for Network Service Descriptors

The 5GTANGO schema that validates Network Service Descriptors  (NSDs) is  defined at the following github repository: 
- https://github.com/sonata-nfv/tng-schema 
- https://github.com/sonata-nfv/tng-schema/blob/master/service-descriptor/nsd-schema.yml



#### Create a service package

A project descriptor for a network service is available here 

<https://github.com/sonata-nfv/tng-tests/tree/master/packages/NSINDP1C>

 that in project.yml is present the following tag:

```
testing_tags:
  - "industrial-pilot-broker"
```

to create the package **tng-smpilot-ns1-k8s.tgo**: 

`tng-pkg -p  /tests/projects/industrial-pilot-ns1-test`

The vnf to be tested is a mqtt broker and the vnf name (**smpilot-cc**) will be needed in the next section

```
network_functions:
  - vnf_id: "vnf_cc"
    vnf_vendor: "eu.5gtango"
    vnf_name: "smpilot-cc"
    vnf_version: "0.1"
```


#### Create a test package

The test-descriptor.yml contains the reference to the probe that will be executed and the dynamic parameters needed for the execution with reference to the vnf that will be tested.

```
probes:
      - id: mqttprobe
        description: "A service initial configuration container"
        image: "easyglobalmarket/mqtt-probe:latest"
        name: mqttprobe
        parameters:
        - key: IP
          value: '$(smpilot-cc/endpoints/id:floating_ip/address)'
        - key: PORT
          value: '$(smpilot-cc/endpoints/id:floating_ip/ports/id:mqtt/port)'
        - key: CLIENTS
          value: '100'
        - key: COUNT
          value: '100'
        - key: SIZE
          value: '100'  

```

A project descriptor for a test is available here 

<<https://github.com/sonata-nfv/tng-tests/tree/master/packages/TSTINDP>

note that in project.yml is present the following tag:

testing_tags:

  - "industrial-pilot-broker"

to create the package **industrial-pilot-test.tgo**: 

`tng-pkg -p  /tests/projects/tng-smpilot-ns1-k8s`

#### Uploading a Service Package and a Test Package to Catalog


1. Using CURL or tng-cli (check installation requirements):

   - curl -X POST http://<vnv_platform_ip>:<server.port>/api/v3/packages  -F "package=@./eu.5gtango.industrial-pilot-test.0.9.tgo" ; 
   - curl -X POST http://<vnv_platform_ip>:<server.port>/api/v3/packages  -F "package=@./eu.5gtango.tng-smpilot-ns1-k8s.0.9.tgo" ; 

   

   tng-cli -u http://pre-int-vnv-bcn.5gtango.eu package -u   eu.5gtango.industrial-pilot-test-egm.0.9.tgo

   tng-cli -u http://pre-int-vnv-bcn.5gtango.eu package -u   eu.5gtango.tng-smpilot-ns1-k8s-egm.0.9.tgo

   

   As a response you will get a message like the following:
   {"package_process_uuid":"c68e0108-ff06-4e58-89e9-573f0250dd08","status":"running","error_msg":null}

   

   Navigate to the V&V Portal to browse the newly added Package at https://<vnv_platform_ip>:<server.port>/validation-and-verification/packages

   You can view the network services contained in package at https://<vnv_platform_ip>:<server.port>/validation-and-verification/network-services

   You can view the network services contained in package at https://<vnv_platform_ip>:<server.port>/validation-and-verification/tests

   ```
   $ curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/services/
   $ curl -s http://<vnv_platform_ip>:<server.port>/api/v3/tests/descriptors/
   ```

   

#### Tagging Tests for a given Network Service

The test package "eu.5gtango.industrial-pilot-test.0.1.tgo" contains the test tag: "industrial-pilot-broker". 

`curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/packages?package_content.testing_tags=industrial-pilot-broker `

Navigate to the V&V Tests page https://<vnv_platform_ip>:<server.port>/validation-and-verification/tests to view the list of tests onboarded.  Click 'industrial-pilot-broker' test instance to view details of the test and also details of test execution.



#### Check the package descriptor

Can check that the created package descriptor contains the required testing_tags.

`curl -s https://<vnv_platform_ip>:<server.port>:32002/api/v3/packages | jq .[] | jq` 
`.pd.package_content.testing_tags,.pd.package_content.id.name,.pd.package_content`
`.uuid`

#### Creation and execution of a Test Plan

Note that the execution of the test is triggered if the tags in NSD and TD match and the testing tag is present in the package descriptor.   

#### Working with the API


* List Packages:

    ```
    curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/packages/ | jq ;
    tng-cli -u http://pre-int-vnv-bcn.5gtango.eu package --list
    ```
* Remove Package by id:

    ```
    tng-cli -u http://pre-int-vnv-bcn.5gtango.eu package -r id676576654
    ```

* List Services: 

    ```
    curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/services | jq ;
    ```
* List Tests:

    ```
    curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/tests/descriptors | jq ;
    ```

* List Test Plans:

    ```	
    curl -X GET "https://<vnv_platform_ip>:<server.port>:6100/api/v1/test-plans" | jq .[]
    ```
    returns the following JSON response payload.
    ```	
    [
      {
      "created_at": "2019-05-30T07:37:46.046+0000",
      "updated_at": "2019-05-30T07:39:40.193+0000",
      "uuid": "efd18ab4-6000-4b72-ba0a-548a25d68da1",
      "test_set_uuid": "57e01b58-937d-4c66-aa92-670636b88b52",
      "service_uuid": "349f99a5-5aff-48c1-b34c-7d042b0befcb",
      "test_uuid": "e06c092f-dd5a-4ee5-9a11-d845fdde04a0",
      "test_result_uuid": "c070de74-99e9-4f29-b226-5c68cfcecd16",
      "test_status": "COMPLETED",
      "confirm_required": false,
      "description": null
    }
    {
      "created_at": "2019-05-30T08:05:36.448+0000",
      "updated_at": "2019-05-30T08:08:24.853+0000",
      "uuid": "97f761f7-9436-42d5-bf89-6722e2893839",
      "test_set_uuid": "da5e1872-1195-4fa4-8208-2f9dfad4e622",
      "service_uuid": "245f2992-e61e-4fae-a14f-5988d4ae3b98",
      "test_uuid": "49dcf7d6-c84a-41c3-a814-9e83581b3dad",
      "test_result_uuid": "e8c51a31-69e9-41a2-856d-6631e2d4773e",
      "test_status": "COMPLETED",
      "confirm_required": false,
      "description": null
    }
    ]
    ```

#### Checking Test Results

Using the **test_result_uuid** we can get the results.

curl -i -H "Content-Type: application/json" -X GET https://<vnv_platform_ip>:<server.port>:4012/trr/test-suite-results/test_result_uuid

