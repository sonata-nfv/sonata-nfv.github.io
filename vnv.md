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

#### Getting Started With V&V Testing

The outline of the tasks to perform in V&V is as follows:
1. Upload a Service Package
1. Upload a Test Package
1. Tagging Tests for a given Network Service
1. Execute a Test Suite
1. Checking Test Results
1. Working with the V&V API


## Prerequisites

Before you can try out V&V functionality you will need the following:
1. A valid Network Service Package created by the SDK:  
1. A valid Test Package created by the SDK:
1. A V&V instance that is configured and integrated with a running Service Platform instance:


#### Schemas for Network Service Descriptors

The 5GTANGO schema that validates Network Service Descriptors  (NSDs) is  defined at the following github repository: 
- https://github.com/sonata-nfv/tng-schema 
- https://github.com/sonata-nfv/tng-schema/blob/master/service-descriptor/nsd-schema.yml

#### Uploading a Service Package

1. Download the following service package (binary file) from Github: 
    * Example Service: 
        * https://github.com/sonata-nfv/tng-y1-demo/tree/master/tango (e.g. eu.5gtango.ns-haproxy.0.1.tgo)


1. Upload package to Catalog:
    * Using cURL:
        *  curl -X POST http://<vnv_platform_ip>:<server.port>/api/v3/packages  -F "package=@./eu.5gtango.ns-haproxy.0.1.tgo" ; 

    As a response you will get a message like the following:
    {"package_process_uuid":"c68e0108-ff06-4e58-89e9-573f0250dd08","status":"running","error_msg":null}
    
    Navigate to the V&V Portal to browse the newly added Package at https://<vnv_platform_ip>:<server.port>/validation-and-verification/packages
    
    You can view the network services contained in package at https://<vnv_platform_ip>:<server.port>/validation-and-verification/network-services


```
$ curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/services/
```

#### Uploading a Test Package

1. First, download the following test package (binary file) from Github: 
    * Example tests: 
        * https://github.com/sonata-nfv/tng-y1-demo/tree/master/tango (e.g. eu.5gtango.test-http-benchmarking-advanced.0.1.tgo)

2. Upload the test package to Test Catalog:
    * Upload test example:
    

```console
        $ curl -X POST http://<vnv_platform_ip>:<server.port>:32002/api/v3/packages  -F "package=@./eu.5gtango.test-http-benchmarking-advanced.0.1.tgo" ; 
```
We can list the tests using the  
```console
curl -s http://<vnv_platform_ip>:<server.port>/api/v3/tests/descriptors/
```
#### Tagging Tests for a given Network Service

The test package "http-benchmarking-test-advanced.0.1.tgo" contains the test tag: "http-advanced". As there is no  Network Service on the server currently then this is no execution test for now.

Navigate to the V&V Tests page https://<vnv_platform_ip>:<server.port>/validation-and-verification/tests to view the list of tests onboarded.  Click 'test-http-benchmark-advanced' test instance to view details of the test and also details of test execution.

#### Uploading a Test Package with a specific Test Tag

In this exercise we will upload a test package that will be relevant for the previous uploading network service. Specifically, a test with a _test tag_ of **'proxy-advanced'** will be executed the network service  ns-haproxy.0.1.tgo that we uploading in the first exercise.


1. Download the following test package (binary file) from Github: 
    * Example tests: 
        * https://github.com/sonata-nfv/tng-y1-demo/tree/master/tango (e.g. eu.5gtango.test-http-benchmarking-advanced-proxy.0.1.tgo)

2. Upload test package to Test Catalog:
    * Upload test example:
        *  curl -X POST http://<vnv_platform_ip>:<server.port>:32002/api/v3/packages  -F "package=@./eu.5gtango.test-http-benchmarking-advanced-proxy.0.1.tgo" ; 



#### Uploading a Service matching a specific Test tag

Upload a service that could match testing_tag "http-advanced" of the previous uploaded test package.

4. ...

#### Execute a Test Suite

#### Checking Test Results

#### Working with the API
 

* List Packages:

    ```
    curl -s http://<vnv_platform_ip>:<server.port>:32002/api/v3/packages/ | jq ;
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
    curl http://<vnv_platform_ip>:<server.port>/trr/test-plans
    ```
    returns the following JSON response payload.
    ```	
    [
      {
        "created_at": "2019-01-22T15:13:16.744+00:00",
        "network_service_instances": [
          {
            "instance_uuid": null,
            "service_uuid": "02f33c78-d07b-45b6-97f7-823dfccc15f1",
            "status": "ERROR",
            "runtime": null
          }
        ],
        "package_id": "cfecdc2e-cbcf-4431-8922-f7a8e54ae4cb",
        "status": "NS_DEPLOY_FAILED",
        "test_suite_results": [
          {
            "package_id": "cfecdc2e-cbcf-4431-8922-f7a8e54ae4cb",
            "uuid": "e0c1cfb5-91c3-4457-8450-ad0c240f6bf6",
            "test_plan_id": "135e6ef3-332f-4804-a645-c5da3dcb77f7",
            "instance_uuid": null,
            "service_uuid": "02f33c78-d07b-45b6-97f7-823dfccc15f1",
            "test_uuid": "35a66966-7db4-4408-8e9d-f0c73a92490f",
            "status": null
          }
        ],
        "updated_at": "2019-01-22T15:13:16.744+00:00",
        "uuid": "1b1adac6-d091-4479-a8e9-5fb744d5f2b4"
      }
    ]
    ```