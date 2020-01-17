### Release v5.1

#### Portal(s)

*  Removed pop up to warn the user to log in again when token expired 
*  Included page not found component when no route is found 
*  Bug fixing in Dashboard 
*  Updated Platforms creation form to disable names with whitespaces 
*  Updated Settings section with: 
    *  VIM monitoring configuration after VIM creation 
    *  YAML to JSON converter in VIM configuration input 
*  Updated Service Management section with: 
    *  Slice instantiation updated with instantiation and custom parameters 
    *  Network services instantiation updated with custom parameters 
    *  Manual scaling 
    *  Policy manual activation/deactivation 
    *  Include requests duration for every operation 
    *  Include a list of related SLAs in each network service detailed view 
    *  Bug fixing 
*  Updated Service Platform section with: 
    *  Updates over SLAs attributes displayed 
    *  Establish links between instances and their descriptors for a quick navigation 
    *  Policy actions update 
    *  Receive the policy monitoring parameters from Prometheus 
    *  Policy duplication leads to an edition view before saving the new policy 
    *  Included further detail on policy rules listed in a runtime policy 
    *  Bug fixing 
*  Updated Validation and Verification section with: 
    *  OSM packages list all its content 
    *  Included the analytics engine menu to list, generate and remove analytic results 
    *  Enable SP and host selection for test plan generation 
    *  Enable policy selection for test plan generation from a network service 
    *  Bug fixing 
*  Created development execution mode to configure the Portal while developing 
*  SDK Portal included

#### V&V Executor
*  Ability to deploy probe's containers in other machines than the V&V's.
*  Files and results are shared between executor and execution hosts via NFS. There is a new environment variable to enable/disable the use of a configured NFS server if the execution probes are executed in other machines that the V&V component. The generated docker-compose is automatically adapted to enable its use.
*  Error Information enrichment: 
    *  test results are sent to Curator even when they don't end OK. If the test ends, the results are sent.
    *  the docker-compose failure is caught and sent to the curator when the execution fails due to docker-compose errors.

#### V&V Planner
*  New optional parameter that allows the deployment of the execution probes containers in other machines than the V&V's.
*  New optional parameter to choose on which Service Platform the service will be instantiated.
*  New optional parameter to test the  service associated policies using de V&V.
*  Error information enrichment:
    *  test results are saved in planner database when test ends with KO.
    *  docker-compose exception messages are saved in planner database when docker-compose, in Executor, fails.


### Release v5.0

#### son-emu
* The 5GTANO lightweight life cycle manager (LLCM) is a new module. The 5GTANGO LLCM module is an improved version of SONATA's dummy gatekeeper and allows to directly on-board and instantiate [5GTANGO network service packages](https://github.com/sonata-nfv/tng-schema/wiki/PkgSpec_LATEST) in an emulated multi-PoP environment. [Example 2](https://github.com/sonata-nfv/son-emu/wiki/Example-2) shows how to use this new module.

* Documentation
    * updated [Example 1: Manually instantiate VNFs](https://github.com/sonata-nfv/son-emu/wiki/Example-1)
    * updated [Example 2: Deploy 5GTANGO service package using 5GTANGO LLCM](https://github.com/sonata-nfv/son-emu/wiki/Example-2)
* Features
    * CNF support in LLCM
    * Multi VDU/CDU support in LLCM
    * E-Tree network support in LLCM
    * Integrated vim-emu with Containernet 3.0
    * LLCM: Instance-specific env. vars
    * LLCM: Custom static placement algorithm
    * LLCM: Integrated with tng-cli
    * LLCM: Multi-instance support
    * LLCM: Port publishing
    * Integration with Juju
* Bugs fixed
    * Glance fake API now works with latest glance and OpenStack clients
    * CORS fix for status endpoint
    * Improved REST performance
    * Fixed chaining support
    * Fixed glance fake API

#### son-mano-framework
* Dynamic network creation based on service requirements, instead of static creation
* Running services can now (partially) be migrated from one PoP to another
* During a migration event, the state can be migrated between VNFs
* Running services can now be scaled in or out multiple VNF instances at a time
* Container-based VNFs are supported for all available workflows
* Service flavors are supported
* Improved support for traffic steering between VNFs, and between a VNF and a service endpoint
* The placement logic now also considers the networking side in its optimization calculations, including QoS requirements
* The mapping of a service on the infrastructure can be provided as input with a service instantiation request
* Installation script to deploy a standalone version of the MANO Framework
* Python-based client library to consume API of standalone MANO Framework
* Removal of plugin manager, placement executive and scaling executive because obsolete
* Reduce size of the MANO Framework containers
* bug fixes

#### son-monitor
* Monitoring manager
	* VnV Monitoring Manager
	* remove API v1
	* include Grafana
	* add new APIs
	* kubernetes monitoring
	* update logging mechanism
	* update libraries and tools
	* Bug fix
* Prometheus
	* upgrade to lastest version
	* enhancements on Prometheus server reconfiguration mechanism
* Pushgateway
	* upgrade to lastest version
* Alert Manager
	* include Prometheus.io Alert Manager
	* alert Manager publish alerts to rabbitMQ
	
#### son-monitor-probe
* Collect custom metrics from containers (K8s) in CNF mon
* Bug fixes in VM mon 
* Bug fixes in SP mon

#### tng-analytics-engine
* Support analytics services upon the test results that are executed by the 5GTANGO V&V Platform
* Support analytics services upon the benchmarking results that are executed by the 5GTANGO SDK benchmarking tool
* Support possibility for registering new analytic services as R packages
* Make available an endpoint to allow external entities to conclude about the availability of this micro-service
* Make documentation on the supported API available from the root

#### tng-api-gtw
* a user role-based authorisation mechanism, defined for each one of the allowed routes
* an existing user roles endpoint, providing client tools with the list of user roles that are defined
* a rate limiting mechanism to protect the platform against DOS attacks
* a readiness and liveliness endpoint, which allows the deployment on a Kubernetes infrastructure
* an improved instrumentation, capturing the total number of HTTP requests and the time each one of them took
* a caching mechanism for read-only entities (mostly services and functions) to improve performance

#### tng-cat
* bugs fix
* Add cleaned up examples
* Standardize logs
* Improve REST Interface Management of:
	* Package Descriptors (PDs)
	* Arbitrary Files
	* Policy Descriptors (PLDs)
	* Network Slice Templates (NSTs)
	* Service Level Agreement Templates (SLAs)
* Introduce Test Descriptors
	* Design and implementation of the costumed storage for the Test Descriptors of the V&V Platform
	* Enrichment of the Test Descriptors with additional metadata
	* Development of RESTful API for the exposure of the available CRUD operations
	* Design and implementation of custom RESTful API for the exposure of the available CRUD operations for the Test Descriptors of the V&V Platform
* Support storing and retrieval of ONAP packages
* Support storing and retrieval of OSM packages
* Enhance the storing and retrieval of 5GTANGO packages
* Development of full–text search in structure–agnostic documents
	* Access of any desirable value included in the deep hierarchically structured data of the descriptors
	* Implementing and utilizing the full–text search functionality based on the design of an index data structure, called inverted ﬁle (IF)
	* Executing complex queries for every level of the machine– readable format of the 5GTANGO descriptors
* Enhancement of the reduction management techniques of data redundancy
* Preventing the use case of duplicate documents

#### tng-cli
* This is the first release of this component. This repository contains two python3 packages:
	* tnglib is a library with functions that help a 5GTANGO user interface with the 5GTANGO Service Platform or V&V
	* tngcli wraps the tnglib library in a CLI-tool
	
#### tng-gtk-common
* package uploading [got additional (and optional) parameters](https://github.com/sonata-nfv/tng-gtk-common/wiki/Packages-management) to improve the work of other components, such as the [SLA Manager](https://github.com/sonata-nfv/tng-sla-mgmt).

#### tng-gtk-sp
* [Network Slice lifecycle management requests](https://github.com/sonata-nfv/tng-gtk-sp/wiki/requests-management) (slice template instantiation and slice instance termination);
* Infrastructure information retrieval and definition (available VIMs and WIMs, creation of networks, etc.);
* [Network Service scaling request](https://github.com/sonata-nfv/tng-gtk-sp/wiki/requests-management) (scaling-out and scaling-in);
* [Virtual Network Function migration request](https://github.com/sonata-nfv/tng-gtk-sp/wiki/requests-management)
* [Service Licensing validation](https://github.com/sonata-nfv/tng-gtk-sp/wiki/Service-licenses), for service instantiations having a defined SLA agreement;
* new (optional) parameters on [Network Service instantiation](https://github.com/sonata-nfv/tng-gtk-sp/wiki/requests-management), like name and description, to facilitate usage of the API clients (e.g., the Portal);

#### tng-gtk-usr
* First working version
* The user "tango" with admin permissions is created when launching the container
*  New users, permissions and endpoints can be created, modified and deleted

#### tng-gtk-utils
* a unified way of writing logs
* a unified way of getting data from a given URL
* a unified way of caching results

#### tng-gtk-vnv
* retrieves [test descriptors](https://github.com/sonata-nfv/tng-gtk-vnv/wiki/test-descriptors-queries)
* manages [test plans](https://github.com/sonata-nfv/tng-gtk-vnv/wiki/test-plans-queries)
* retrieves [test results](https://github.com/sonata-nfv/tng-gtk-vnv/wiki/test-results-queries)

#### tng-monitor-infra
* Libvirt exporter
	* Add collection mechanism from hypervisor (libvirt)
* Kubernetes monitoring
	* Add monitoring pods for exposing metrics from Kubernetes cluster to Prometheus.io
	
#### tng-policy-mngr
* Runtime & Placement Policies
	* Default enforcement / deactivation of runtime policies upon the deployment / termination of a Network Service;
	* Support creation of policies via the platform user interface;
	* Enable and Disable multiple runtime policies during a network service lifecycle;
	* Support duplication (cloning) a runtime policy
	* Support validation of placement policies
* Other features
	* Make available an endpoint to allow external entities to conclude about the availability of this micro-service;
	* Make documentation on the supported API available from the root;

#### tng-portal
* New authentication system providing security to all the operations performed from the web application. It includes a registration system that allows the users to create a new account.
* New dashboard with all the relevant information to know the status of the platform and all the components inside.
* New Platforms section to manage the existing platforms in the 5GTANGO project.
* New Settings section to manage the endpoints, VIMs and WIMs in the platform.
* Updated Service Management section with:
	* the generation and management of the network slice instances
	* the inclusion of more information relative to the created instances
	* the possibility to list and purchase the existing licenses
* Updated Service Platform section with:
	* the list of SLA violations produced
	* the ability to create licenses
	* the display and management of the placement policy
	* the ability to fully manage and operate with runtime policies
	* the list of performed actions by the runtime policies
* Updated Validation and Verification section with:
	* the concept of test plans and all the operations required to manage them (execute, cancel, confirm execution, etc.)
	* the ability to create test plans from a test or a network service
	* more information about the uploaded tests such as related services or previously generated test plans.

#### tng-schema
* Support for multiple VM flavors (eg, bronze to gold) in a VNFD, defining different resource requirements or QoS requirements. This allows the service platform to dynamically select the best flavor according to current SLAs
* Support for new VNFD types:
	* Support for cloud native deployment units within VNFDs: CNF (cloud native network functions) support
	* Support for physical deployment units within VNFDs: PNF (physical network functions) support
	* Support for mixed deployment units within one VNFD: HNF (hybrid network functions) support
* Allow specifying arbitrary QoS requirements for vLinks and connection points in VNFDs and NSDs
* Allow specifying alternative VDU images for deploying VNFs on multiple architectures (e.g., x86, ARM, etc.)
* Additional, optional fields requested by VNF vendors at the ETSI plug test: vm_flavor, security_groups, etc. for each VDU
* Updated slice schemas for multi-VIM deployments, for ingress and egress nodes
* Several fixes and smaller adjustments in all schemas

#### tng-sdk-benchmark
This is the initial release of the 5GTANGO benchmarking tool. This tools allows to automate NFV benchmarking experiments end-to-end. Further details about the use of this tool can be found here:

M. Peuster, S. Schneider, H. Karl: [The Softwarised Network Data Zoo](https://sndzoo.github.io/). In IEEE/IFIP 15th International Conference on Network and Service Management (CNSM), Halifax, Canada. (2019)

M. Peuster and H. Karl: [Profile Your Chains, Not Functions: Automated Network Service Profiling in DevOps Environments](http://ieeexplore.ieee.org/document/8169826/). IEEE Conference on Network Function Virtualization and Software Defined Networks (NFV-SDN), Berlin, Germany. (2017)

M. Peuster, H. Karl: [Understand Your Chains: Towards Performance Profile-based Network Service Management](http://ieeexplore.ieee.org/document/7956044/). Fifth European Workshop on Software Defined Networks (EWSDN). IEEE. (2016)

M. Peuster, H. Karl, and S. v. Rossem: [MeDICINE: Rapid Prototyping of Production-Ready Network Services in Multi-PoP Environments](http://ieeexplore.ieee.org/document/7919490/). IEEE Conference on Network Function Virtualization and Software Defined Networks (NFV-SDN), Palo Alto, CA, USA, pp. 148-153. doi: 10.1109/NFV-SDN.2016.7919490. (2016)

You find further documentation and installation guides in the [project wiki](https://github.com/sonata-nfv/tng-sdk-benchmark/wiki).

This tool is one of the open-source reference implementations for the IETF BMWG draft: [Methodology for VNF Benchmarking Automation](https://tools.ietf.org/id/draft-rosa-bmwg-vnfbench-04.html) by R. Rosa, C. Rothenberg, M. Peuster, and H. Karl.

* Core features of this release
	* PED file based experiment description
	* automated 5GTANGO package generation
	* vim-emu platform driver
	* Docker result collection driver
	* Prometheus time series data collection
	* automated parameter study expansion
	
#### tng-sdk-package
* This release adds a lot of new features to the 5GTANGO package. The highlights are:
	* support to package native OSM as well as ONAP packages
	* tight integration with the other SDK tools, such as tng-sdk-validate and tng-sdk-benchmark
* New Features
	* integrated with tng-sdk-benchmark
	* added --quiet flag
	* 5GTANGO standadised JSON logging format
	* integrated with tng-sdk-validation
	* multi-use support
	* support for OSM and ONAP descriptors in 5GTANGO packages
	* support to upload multiple VNFDs to tng-cat
	* added testing_tags
	* autoversion support
	* V&V integration
	* OSM storage backend
	* recursive directory compression
	* packaging using REST API
	* schema download at build time
	* allow to control the validator by ENV vars
	* packaging of native OSM packages
	* packaging of native ONAP packages
* Bugfixes
	* fixed validation level
	* fixed detection of OSM / ONAP descriptors
	* early fail if user wants to run on Python2
	* fixed packaging callback (REST)
	* fix be robust against empty tag lists
	* refactoring (a lot!)
	
#### tng-sdk-project
* This release adds many new features to the 5GTANGO tng-sdk-project tool. The highlights are:
	* Support for descriptor generation
	* Service mode with REST API

* New Features
	* Descriptor Generation]
		* Improved descriptor generation architecture with modular generation plugins
		* Integrated descriptor generation into project management
		* When creating a new project, additional CLI arguments can be passed to specify which descriptors should be generated inside the new project
		* Example: tng-project -p new-project --author 5gtango --vnfs 3
		* --empty creates an empty project without any descriptors
	* Service Mode with REST API
		* Introduced tng-sdk-project service mode, exposing a REST API
		* Similar functionality as the CLI version:
		* Add/remove/modify projects
		* Use the descriptor generator to generate initial descriptors in new projects
		* API specification with Swagger (generated by flask-restplus)
		* API testing with Tavern
		* Endpoint for statically serving generated projects and descriptors
		* Endpoint for automatic packaging (incl. validation) if 5GTANGO packager and validator are installed
	* Other
		* Added project UUID for quick and easy identification of projects
		* Support for MIME type detection and handling of descriptors of tests, SLAs, policies, and slices (in addition to VNFs and NS)
		* Support for adding (zip) files containing a large number of files (e.g., Charms) that need to be handled together

#### tng-sdk-sm
* Total refactoring towards a python-based tool
* Refinement of the creation of new specific managers
* Support for local service specific manager testing
* Generation of service and vnf records, to serve as input for testing cases
* Refinement of the specific manager template and base class

#### tng-sdk-test
* Using packages to deploy a network service
* Composing a network service in a test code by adding multiple VNF images and connecting them with links
* Building VNF images using their source code and Dockerfile
* Sniffing traffic on links
* Validating test code against V&V platform requirements
* Generating probe images and test descriptors

#### tng-sdk-validation
* Supports other descriptor files validation: tests, policies, slices and SLAs
* Includes CNFs validation to give support to Kubernetes deployments
* New custom rules validation: BW and PCI validation
* New custom rules templates to help the user to start with
* Allows offline validation
* Clearer logs with more information relative to the errors
* Bug fixing

#### tng-sla-mgmt
* Update SLA Schema (YML, JSON)
	* Simplify & Optimize the SLA Schema
	* Update SLA schema to support Licensing information
	* Update SLA schema to support optional guarantee terms
* Add cleaned up SLA examples (YML, JSON)
* Standardize logs (Apache Log4j2 logging services)
* Optimize the SLA Template generation
* Mapping of SLOs with monitoring parameters in the SLA template
* Introduce User Authentication in SLAs
	* Include user authentication in all SLA APIs
	* Include user authentication in all RabbitMQ messaging
	* Include user information in Templates
	* Include user information in Agreements
	* Include user information in Licenses
* Support Kubernetes (K8s) compatible development
	* Support multiple RabbitMQ instances
	* Both scenarios (OpenStack WIM/K8s) are supported
* Introduce new SLA parameters (availability, packet loss, input connections)
* Introduce mapping between low-level QoS parameters and high-level SLA terms
	* Usage of deployment flavors in order to solve the problem of deploying different flavours of a NS according to the SLA
	* Create the mapping between a desired deployment flavor and an SLA during the SLA Template creation
	* Support of efficient CRUD operations for managing and configuring the deployment flavor in the SLA Template, through RESTful APIs.
* Introduce Licensing as a Service into SLAs:
	* Add Licensing as a Service Level Objective (SLO)
	* Include license information into the SLA Template
	* Introduce license per NS and customer
	* Introduce three kinds of license types (Public, Trial, Private)
	* Introduce buying of a license in case of private license
	* License specifies the number of allowed NS instances
	* Check license status during NS instantiation
	* Support of efficient CRUD operations for managing and configuring all the Licensing information, through RSTful APIs.
	* Create relevant database table for storing correlation records between NS-SLA-Customer
* Provide statistic information for graphs creation
	* Nº SLA Agreements vs. Violations
	* Nº Licenses Utilized / Nº Licenses Expired / Nº Licenses Acquired
* Updated integration with:
	* tng-portal
	* son-monitor
	* tng-cat
	* son-broker
	* son-postgre
	* tng-api-gtw
	* tng-gtk-sp
	* tng-schema
	
#### tng-slice-mngr
* Network Slice Template/Instance Objects Updated in order to manage the newest features.
* Network Slice manager REST API updated with new intra-components (non public) endpoints in order to have e better management of the objects created.
* New features:
  * Interconnection of Network Service composing the Network Slice.
  * Network Slice Instances can share Network Services among them.
  * SLA assignation to those Network Services composing the Network Slice.
  * Single-VIM deployment
  * Allows to provide connections from/to endpoints outside the NFVI using SDN.
* Integrated with the following SONATA SP components:
  * tng-rep
  * tng-cat
  * tng-gtk-sp
  * tng-gtk-common
  * tng-portal
  * tng-sp-ia
  * tng-sla-mngr
  
#### tng-sp-ia
* A new architecture plugin based, with multiple containers, one for NBI and one for each VIM/WAN type. This approach possibilite different developers with different programming languages work in separate repos, like explained in refactoring motivations.
* The separation of the functions, features and data model between NBI and VIM/WAN Wrappers could be found in Introduction.
* A new IA RabbitMQ Internal Interface for interconnect the NBI with the VIM/WAN Wrappers.
* A new Rest API Reference for manage (GET, POST, PATCH, DELETE) the VIMs/WIMs/Endpoints in the DB.
* New supported dynamic networks (create/delete according info from mano/'slice manager'), QoS rule types for network, and some network Miscellaneous (flavor/mac/ip/security groups/CIDR specification) features for HEAT Wrapper.
* New logging format in json for graylog.
* Integration work for support new wrappers from others repos: k8s, tapi and emu.
* New messages and others modified in RabbitMQ API Reference, according requirements from new wrappers and from mano.

#### tng-sp-ia-emu
* This is the first release of this component. It manages communication between the MANO Framework and the Emulator VIM and WIM. The entire API required by the MANO Framework is supported.

#### tng-sp-ia-k8s
Cloud-native Network Functions Wrapper for Kubernetes. 
This wrapper for kubernetes is able to generate kubernetes objects from SONATA VNF descriptors. The objects modelled for kubernetes are the following:
* Deployments
* Services
* Volumes
* Configmaps
And the wrapper is able to do:
* Rolling updates of the service
* Service reconfiguration from FSM
* Adding environmental variables of service and functions for auto-discovery
* Recovering monitoring data from k8s cluster for VIM selection in placement plugin
* Nvidia GPU selection
* Scale PODs via request from MANO

#### tng-sp-ia-wtapi
* Creation of virtual links outside VIM scope between external or internal endpoints
* Multi-VIM connection support
* T-API 2.0 compliant interface

#### tng-vnv-executor
* Acceptance of test requests from Curator
* Generation of a docker-compose file with the test descriptor received from Curator
* Tests execution using test probes (docker images) against the deployed network services
* Validation and Verification of the test conditions
* Execution progress Notifications to Curator
* Export results in the test results repository

#### tng-vnv-curator
* Launch of Test Plans from tng-vnv-planner
* Preload of probe images for the tng-vnv-executor to run them when time comes
* Processing of post-instantiation parameters received from tng-vnv-platform-adapter and the corresponding test descriptor is updated with current values
* Performs the clean up of the environment after test execution finishes

#### tng-vnv-dsm
* Design and Implementation of a Decision Support Mechanism for the V&V Platform
* Implementation User's test recommendations retrieval 
* Build test recommendations examples for 5GTANGO end-users with real data
* User retrieval from the trained system via test executions history
* Testing Tags retrieval from test executions history  
* Implementation of user-item Pairing approach via the 5GTango Package Descriptor 
* Integration of tng-vnv-dsm with tng-portal, tng-api-gtw and tng-gtk-vnv modules

#### tng-vnv-planner
* Acceptance of test plan requests according to Catalog's notifications for new packages
* Test Descriptor (TD) Retrieval from incomming NSD's received by Catalog
* Service Descriptor (NSD) Retrieval from incomming TD received by Catalog
* Test Plan Creation for each (NSD,TD) pair
* Delegation of the Test Plan Execution Request to Curator
* Execution progress Notifications from Curator
* Sortable Test Plans Execution
* Acceptance of ad-hoc test plan requests
* Deletion of existing test plans

#### tng-vnv-platform-adapter
* Sonata and OSM supported as Service Platforms
* Can deploy in multiples SP of the same type
* Retrieve the instances info to report to the Curator component
* Retrieve the instances and vim info to report to the Monitoring Manager component


### About the latest major release v4.0

#### tng-vnv-lcm
* API for notification of modified package in catalogue
* API for manual test invocation
* Initial integration towards 5GTANGO SP
* Ability to support creation of test execution plans via tagging mechanism
* API for querying test results

#### tng-portal
* Added menu sections to navigate through app
* Added Validation and Verification section containing a list of the defined Tests.
* Added Service Platform section containing: Packages, Services, Functions, Placement Policy, Runtime policies, SLAs and Slices management.
* Added Service Management section containing: Services, Requests and Network Service Instances management.

#### tng-sdk-validation
* Syntax, integrity and topology validation as it was implemented in sonata-nfv/son-cli tool.
* Added complete unit tests for validation function, CLI and REST API.
* REST API with synchronous and asynchronous modes.
* Added basic custom rule validation, unit testing and example rule descriptor.
* Descriptor schemas are downloaded from sonata-nfv/tng-schema repository. In future versions the URL to download to schema will be obtained from the Descriptor.
* REST API local mode with watchers implemented (only for functions).
* API refactor to follow REST API best practices.

#### son-mano-framework
* Northbound API extension with a scaling API: It is now possible to request a scaling event of a running NS
* Policy based placement: the Placement Plugin takes placement policies from NS developers, customers and the operator into consideration when calculating the optimal placement.
* ILP based algorithm: The generic placement algorithm is formulated and solved as an ILP problem.
* The SSM mechanism was extended so that it can now make scaling and migration requests to the MANO Framework.
* Improved ENV variable handling.
* CI/CD done through Jenkins pipeline.
* Minor bug fixes.

#### tng-probes
* moongen: The MoonGen probe based on the MoonGen packet generator
* uperf: Network probe based on uperf network performance tool
* owamp: (one-way active measurement protocol) to Prometheus
* wrk: HTTP benchmarking tool based mostly on wrk

#### son-sp-infrabstract
* Cloud-init support for HEAT based stacks
* Scaling out support for HEAT based stacks
* Minor bug fixes

#### tng-sdk-img
* functionality for converting Docker-based VNFs to QEMU-based VNFs 
* separate processing of VDUs
* support of local docker images

#### tng-sdk-descriptorgen
* Simple and responsive web-based GUI based on Bootstrap
* Generation of NSD and VNFDs based on provided high-level information and sensible default values with one click
* Users only need to specify high-level information
* Generated descriptors can be edited in the GUI (with syntax highlighting) to quickly perform small adjustments
* Final descriptors can be downloaded as zipped NFV project, including a generated project manifest (project.yml), which is necessary for further project management or packaging

#### tng-sdk-package
* Packaging using CLI
* Unpackaging using CLI or REST
* Docker-based micro service deployment
* Basic (static) package validation
* Multiple packager components
* Multiple storage backends

#### son-emu
* Integrated vim-emu with OSM release FOUR
* Re-deploy network services without emulator restart
* Made complete codebase PEP8 compatibles
* Added automated code style checks to the CI pipeline
* Made port deletion process more robust
* Better unit tests
* Cleaned up examples
* Added examples for OSM release FOUR
* Many small bug fixes

#### tng-sdk-project
* Create new 5GTANGO workspaces (e.g., with configuration files)
* Used by other SDK tools, e.g., to determine the MIME type of 5GTANGO descriptors
* Create new NFV projects containing arbitrary artifacts, e.g., descriptors or VNF images
* Automatically generates a corresponding project manifest (project.yml), which states project information and lists all involved files
* Project files can easily be added or removed with --add and --remove, supporting wildcards (similar to the well-known git CLI)
* The project status (--status) provides a quick overview of the project information and involved files
* A translation functionality (--translate) automatically translates old SONATA projects to the new v4.0 format
* Complementary to the simple descriptor generation GUI
* Quick generation of descriptors for experienced users, preferring a CLI
* To be integrated with the project management in the future (e.g., to automatically generate suitable descriptors when creating a new project) 

#### tng-sla-mgmt
* SLA Schema Introduced (YML, JSON)
* SLA Template examples provided (YML, JSON)
* Create a new SLA Template with one or more guarantee terms
* Automatic formulation of the Agreement, when a Network Service is instantiated
* Mark SLA (Agreement) as ‘TERMINATED’ on service termination
* Mark SLA (Agreement) as ‘VIOLATED’APIs for SLAs Management are introduced (Check WIKI pages)
* Consume SLA violation alert from Monitoring Manager (Through MQ)
* Publish violation alert to another topic (SLA manager driven)
* Unit tests developed
* CheckStyle tests developed
* Integration tests developed (tng-tests Github’s Repository)
* Health Check developed (PING/PONG)

#### tng-vnv-tee
* Ability to support creation of test execution plans via tagging mechanism
* Support for three test plugin types: Bash, Wrk and TTCN-3

#### tng-slice-mngr
* Network Slice Template/Instance Objects Defined
* Network Slice manager REST API
* Two work modes with Sonata SP (further information in this wiki page: About the work modes).

#### tng-sdk-sm
* Creation and removal of SSMs and FSMs
* Generating payloads that serve as input for tests for FSM routines
* Execution and testing of SSM and FSM routines, with generated or custom payloads as input

#### tng-gtk-sp
* Allow for service records querying
* Allow for function records querying
* Allow a Network Service to be instantiated;
* Allow a Network Service instance to be terminated;
* Make available an endpoint to allow external entities to conclude about the availability of this micro-service
* Make documentation on the supported API available from the root


#### tng-cat
* Support for JSON and YAML formats for descriptors
* Support of full-text search in the content of the descriptors and the corresponding metadata
* Support of GridFS File System for storage of 5GTANGO Packages/Arbitrary Files
* Developed Unit Tests for the component
* Included in integration tests with several components
* Enrichment of package descriptor files with additional metadata
* Development of RESTful API for the exposure of the available CRUD operations
* Intelligent delete of the entire 5GTANGO package from the delete operation of the corresponding package descriptor
* Full mapping of the content of the corresponding 5GTANGO Package inside the Package Descriptor
* Enrichment of virtualized network function descriptor files with additional metadata
* Development of RESTful API for the exposure of the available CRUD operations
* Enrichment of network service descriptor files with additional metadata
* Development of RESTful API for the exposure of the available CRUD operations
* Enrichment of 5GTANGO Package file with additional metadata
* Development of RESTful API for the exposure of the available CRD operations of the metadata
* Retrieval of the binary data from the GridFS File System
* Full mapping of 5GTANGO Package with the included files
* Enrichment of arbitrary files with additional metadata
* Development of RESTful API for the exposure of the available CRD operations of the metadata
* Retrieval of the binary data from the GridFS File System
* Enrichment of policy descriptor files with additional metadata
* Development of RESTful API for the exposure of the available CRUD operations
* Enrichment of network slice template files with additional metadata
* Development of RESTful API for the exposure of the available CRUD operations
* Creation of dynamic update mechanism of arrays included in the descriptors
* Enrichment of service level agreement template files with additional metadata
* Development of RESTful API for the exposure of the available CRUD operations

#### tng-rep
* Store network service instance records
* Store network slice instance records
* Store VNF instance records
* Store test suite results
* Store tests plans

#### son-monitor
* Addition of new APIs
* Support Alerting for SLA and Policy Components
* Support SNMP protocol
* Upgrade notification mechanism
* Bug fix

#### son-monitor-probe
* Update metric labels
* Update metric labels

#### tng-monitor-infra
* Add collection mechanism from OpenStack ceilometer
* Add collection mechanism from OpenDayLight controller

#### tng-schema
* Added descriptors for: Tests, Policies and SLAs

#### tng-gtk-vnv
* Test querying
* Test plans querying
* Test results querying

#### tng-gtk-common
* Allow the uploading of packages;
* Allow the query of the package processing status;
* Allow the validation of the uploaded packages;
* Allow the retrieval (download) of the uploaded package file;
* Allow the query of package's meta-data;
* Allow the notification of external systems about the successful un-packaging of a package;
* Allow the notification of the entity that as uploaded the package about the final result of the process;
* Allow the query of package's options.Allow the query of services's meta-data;
* Allow the query of services's options.
* Allow the query of function's meta-data;
* Allow the query of function's options.
* Allow the query of the component's root content;
* Allow the query of the component's availability.

#### tng-api-gtw

* a request redirection mechanism (NGINx web server) adequately configured for 5GTANGO's infrastructure;
* a simple routing mechanism, configurable at deployment time, to route requests from the outside to a specific (set of) micro-services;
* support for the main HTTP verbs in the request: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD
* basic request validation mechanisms, such as HTTP verb(s) allowed, user authentication needed, etc., to avoid invalid requests to proceed within the stack;
* logging and KPI collection;


### About the latest minor release v3.1

Release v3.1 of the SONATA platform is mainly a bug fixing update. Still, a number of enhancements made it into this version. Among them are the following:

* Enhancement of email notification mechanism in monitoring system
* Additional information exposure by infrastructure adapter
* Increased flexibility of the SSM/FSM mechanisms
* Example of placement SSM
* Security enhancements
* Upgrade of underlying libraries to eliminate security vulnerabilities

### About the latest major release v3.0

This is version 3.0 of the SONATA platform, the fifth release of the code. The main enhancements since the last release, v2.1, are:

This is version 3.0 of the SONATA platform, the fifth release of the code. The main enhancements since the last release, v2.1, are:

* SP:
  * improved customizability/programmability of the MANO framework
  * improved user, role and group management
  * improved access control
  * added package validation and signature verification
  * added package, service and function ownership (to connect with licence management)
  * added location-awareness for placement decisions in service instantiation
  * added KPIs to most operations
  * added synch (through a Web Socket) and asynch (through JSON) monitoring data requests
  * added service instance termination
  * added rate limit control to all operations
  * support for service licence management
* SDK:
  * Integrated authentication support in son-access (part of son-cli). This allows to authenticate users before they connect to the/a service platform
  * Support for package signatures in son-package (part of son-cli). This enables a/the service platform to validate that service/function packages are actually originating from trusted developers
  * Graphical User Interface (son-editor) for the creation of network services and associated service and network function descriptors.
  * Improved integration with GitHub. This enables easy reuse of existing service and function descriptors directly from GitHub repositories.
  * Inclusion of advanced service validation functionality including graphical debugging tool (son-validate).
  * The emulator (son-emu) now supports OpenStack-like API endpoints to allow carrier-grade MANO stacks (SONATA, OSM) to control the emulated VIMs
  * The emulator (son-emu) has added a prototype implementation of OpenStack Neutron's SFC chaining API to the emulator
  * The emulator (son-emu) is now compatible with 802.1Q Standard 5.3.1 in using the fixed VLAN-tag range for internal chaining system
  * The emulator (son-emu) now supports experimenting with different placement topologies as well as evaluating different scaling options.
  * The profiling tool now supports two profiling modes: i) active mode in order to generate a range of service and resource configurations which can be deployed and for which metrics can be collected, and ii) passive mode which enables to gather metrics directly in the emulator
  * The monitoring component (son-monitor) enables to receive streamed monitoring data from the SONATA service platform through Websockets
  * The monitoring component (son-monitor) supports host overload detection functionality from VNFs.
  * The monitoring component (son-monitor) supports external service access points for traffic generation and reception.
  * Reusable Service and Function Specific Management templates have been added for monitoring, scaling and placement. These can be easily adapted by developers in order to implement custom logic.
* General ones:
  * improvements for multi-PoP environments
  * improved installation process
  * many additional features, bug fixes, performance improvements
