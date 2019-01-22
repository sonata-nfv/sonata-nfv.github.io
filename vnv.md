#Validation and Verification

V&V is the 5GTANGO component responsible for executing the test suites for 5G Network Services.
As such, the V&V Platform provides a means of ensuring that theseservices can be tested on an appropriate target orchestration platform. 

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




####Getting Started With V&V Tests
...


1. Upload a Network Service Package
1. Upload a Test Package
1. Tagging Tests for a given Network Service
1. Execute a Test Suite
1. Checking Test Results
1. Working with the V&V API


## Prerequisites

Before you can try out V&V functionality you will need the following:
1. A valid Network Service Package created by the SDK:  
1. A valid Test Packages created by SDK:
1. A V&V instance that is configured and integrated with a running Service Platform instance:


####Upload a Network Service Package

The 5GTANGO schema that validates Network Service Descriptors  (NSDs) is  defined are the following github repo: 
- https://github.com/sonata-nfv/tng-schema 
- https://github.com/sonata-nfv/tng-schema/blob/master/service-descriptor/nsd-schema.yml

#### Uploading the Service Package

1. Download the following service package (binary file) from Github: 
	* Example Service: 
		* https://github.com/sonata-nfv/tng-y1-demo/tree/master/tango (e.g. eu.5gtango.ns-haproxy.0.1.tgo)


1. Upload package to Catalog:
	* Using cURL:
		*  curl -X POST http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/packages  -F "package=@./eu.5gtango.http-benchmarking-test-advanced.0.1.tgo" ; 


#### Uploading the Test Package

1. First, download the following test package (binary file) from Githuub: 
	* Example tests: 
		* https://github.com/sonata-nfv/tng-y1-demo/tree/master/tango (e.g. eu.5gtango.http-benchmarking-test-advanced.0.1.tgo)

2. Upload test package to Test Catalog:
	* Upload test example:
		*  curl -X POST http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/packages  -F "package=@./eu.5gtango.http-benchmarking-test-advanced.0.1.tgo" ; 


#### Tagging Tests for a given Network Service

The test package "http-benchmarking-test-advanced.0.1.tgo" cobtains the test tag: "http-advanced". As there is no  NService on the server currently. so no testing for now.


	* Upload Service<sup>*3</sup>::
		* curl -X POST http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/packages  -F "package=@./eu.5gtango.ns-haproxy.0.1.tgo" ;

3. Upload a service that could match testing_tag "http-advanced" of the previous uploaded test package.

4. ...

#### Execute a Test Suite

#### Checking Test Results

#### Working with the V&V API
 

* List Packages:

	```
	curl -s http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/packages/ | jq ;
	```

* List Services:

	```
	curl -s http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/services | jq ;
	```
* List Tests:

	```
	curl -s http://pre-int-vnv-bcn.5gtango.eu:32002/api/v3/tests/descriptors | jq ;
	```