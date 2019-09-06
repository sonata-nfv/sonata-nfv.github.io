### About the latest major release v5.0

###tng-gtk-sp
* Network Slice lifecycle management requests (slice template instantiation and slice instance termination);
* Infrastructure information retrieval and definition (available VIMs and WIMs, creation of networks, etc.);
* Network Service scaling request (scaling-out and scaling-in);
* Virtual Network Function migration request;
* Service Licensing validation, for service instantiations having a defined SLA agreement;
* new (optional) parameters on Network Service instantiation, like name and description, to facilitate usage of the API clients (e.g., the Portal);

###tng-portal
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

###tng-vnv-curator
* Launch of Test Plans from tng-vnv-planner
* Preload of probe images for the tng-vnv-executor to run them when time comes
* Processing of post-instantiation parameters received from tng-vnv-platform-adapter and the corresponding test descriptor is updated with current values
* Performs the clean up of the environment after test execution finishes

###tng-sp-ia
* A new architecture plugin based, with multiple containers, one for NBI and one for each VIM/WAN type. This approach possibilite different developers with different programming languages work in separate repos, like explained in refactoring motivations.
* The separation of the functions, features and data model between NBI and VIM/WAN Wrappers could be found in Introduction.
* A new IA RabbitMQ Internal Interface for interconnect the NBI with the VIM/WAN Wrappers.
* A new Rest API Reference for manage (GET, POST, PATCH, DELETE) the VIMs/WIMs/Endpoints in the DB.
* New supported dynamic networks (create/delete according info from mano/'slice manager'), QoS rule types for network, and some network Miscellaneous (flavor/mac/ip/security groups/CIDR specification) features for HEAT Wrapper.
* New logging format in json for graylog.
* Integration work for support new wrappers from others repos: k8s, tapi and emu.
* New messages and others modified in RabbitMQ API Reference, according requirements from new wrappers and from mano.

###tng-sp-ia-k8s
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

###tng-slice-mngr
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
  
###tng-vnv-planner:
* Acceptance of test plan requests according to Catalog's notifications for new packages
* Test Descriptor (TD) Retrieval from incomming NSD's received by Catalog
* Service Descriptor (NSD) Retrieval from incomming TD received by Catalog
* Test Plan Creation for each (NSD,TD) pair
* Delegation of the Test Plan Execution Request to Curator
* Execution progress Notifications from Curator
* Sortable Test Plans Execution
* Acceptance of ad-hoc test plan requests
* Deletion of existing test plans

###tng-vnv-executor
* Acceptance of test requests from Curator
* Generation of a docker-compose file with the test descriptor received from Curator
* Tests execution using test probes (docker images) against the deployed network services
* Validation and Verification of the test conditions
* Execution progress Notifications to Curator
* Export results in the test results repository

###tng-vnv-dsm
* Design and Implementation of a Decision Support Mechanism for the V&V Platform
* Implementation User's test recommendations retrieval 
* Build test recommendations examples for 5GTANGO end-users with real data
* User retrieval from the trained system via test executions history
* Testing Tags retrieval from test executions history  
* Implementation of user-item Pairing approach via the 5GTango Package Descriptor 
* Integration of tng-vnv-dsm with tng-portal, tng-api-gtw and tng-gtk-vnv modules


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
