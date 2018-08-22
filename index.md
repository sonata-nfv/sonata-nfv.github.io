---
layout: default
---

<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Foreword

## Purpose of this tutorial

The purpose of this tutorial is to provide the reader with a general view about 5GTANGO platform in the easiest and quickest way possible.
Here you will find a brief explanation about what 5GTANGO is, how to install it, how to use it and how to get technical support if required.
This tutorial doesn´t pretend to be an extend document where to find all the information related to 5GTANGO, but an "umbrella" document that will guide you to more extensive documentation if required.

## Document structure

This quick guide is organized in the following manner:

* Section 1 (this section) is an introduction to the guide.
* Section 2 provides general presentation about 5GTANGO: what 5GTANGO is and for whom, its general architecture, and a brief description of its main modules, the Service Platform (SP) and the Service Development Kit(SDK) and the Validation and Verification(VnV).
* Section 3 gives information about the current 5GTANGO software release.
* Section 4 explains the installation process for each of the 5GTANGO components that can be installed and used individually. These are the VnV, the SP, the SDK and the Emulator that, although part of the SDK, has its own autonomy.
* In section 5, we describe briefly how to use 5GTANGO once installed, from the creation of a service, how to test it using the emulator, to its deployment with the Service Platform . 


## 1. Brief 5GTANGO introduction

5GTANGO is an agile service development and orchestration framework for 5G virtualized networks. It provides a programming model and a development tool chain for virtualized services, fully integrated with a DevOps-enabled service platform and orchestration system. 5GTANGO therefore targets both the flexible programmability of software networks as well as the optimization of their deployments. Its modular design makes the SONATA service platform effortlessly customizable to meet the needs of different service providers.

### What is 5GTANGO ? 

5GTANGO provides a platform for supporting the lifecycle of virtualized networking services. In particular, network function chaining and orchestration are the target domains of SONATA.

### Who is it for ? 

The 5GTANGO platform supports two main stakeholders in telecommunications service creation: service developers and service operators. 5GTANGO's Network Service Development Kit (SDK) facilitates network service development for service developers. Such services are then deployed and run on 5GTANGO's Service Platform. Through its extensive customization capabilities, the service platform allows communication service providers to adapt service provisioning to their specific environment and needs. 5GTANGO enables a DevOps workflow between the SDK tools and the service platform, which allows developers and operators to closely collaborate in providing an outstanding experience to customers. Also you have available the VnV for testing purposes.

## 2. General architecture

The main architectural components of the 5GTANGO platform are shown in the figure below. In line with the support of service developers and service operators, SONATA distinguishes the two main components SDK and service platform. Services developed and deployed by this system run on top of the underlying infrastructure accessible to the SONATA system via Virtual Infrastructure Managers (VIMs), abstracting from the actual hardware and software.

Each of the three main components can be divided into a number of subcomponents, realized in a micro-service-based approach. Detailed information on the architecture and its components can be found in [https://5gtango.eu/project-outcomes/deliverables/2-uncategorised/31-d2-2-architecture-design.html].

![](https://github.com/sonata-nfv/sonata-nfv.github.io/blob/master/5GTANGOmaincomponents.png?raw=true)

## 5GTANGO modules

The 5GTANGOplatform consists of a number of software modules which together provide the required functionality for network service creation, deployment, and management. Most modules can be attributed directly to either the service platform or to the service development (SDK), according to their use. Some modules are cross-cutting and are used in both major components.

### Service Platform

5GTANGO's Service Platform (SP) is where:

* users are created, authenticated and authorized;
* packages, containing (network) services and (virtual network) functions descriptions, are on-boarded, validated and stored in the catalogue. A service or a function can bring with it a specific manager, which may change the default behaviour the SP has for specific aspect of that service's or function's lifecycle (e.g., placement, scaling, etc.);
* services from the catalogue are instantiated (with licences verified) and orchestrated, through the MANO, in the abstracted infrastructure;
* instantiation records are generated and stored, providing instantiation data to the other components;
* monitoring data is collected and securely provided on demand to the service developer, thus allowing quick and frequent service improvements;
* KPIs are collected, to show the overall business performance of the system.



The main modules of the SP are the following:

* ***[Gatekeeper](https://github.com/sonata-nfv/son-gkeeper):*** controls and enforces whoever (and whatever) wants to interact with the SP and guarantees the quality of the submitted packages, by validating them against a schema (syntactically), the topology of the described service and it's integrity;
* ***[Catalogues](https://github.com/sonata-nfv/son-catalogue):*** stores and manages (smart delete: only packages with services that do not have running instances can be deleted) package files, it's meta-data as well as service's and functions' meta-data. The catalogues use the SONATA schema for their metadata as defined in [SONATA schema]([https://github.com/sonata-nfv/son-schema);
* ***[MANO Framework](https://github.com/sonata-nfv/son-mano-framework):*** the orchestrator, who manages each service's lifecycle, including when the service and/or its functions bring specific managers with them to be used in certain segments of their lifecycle. Please note the clear separation between the two levels, the ***Network Function Virtualization Orchestrator (NFVO)*** and the ***Virtual Network Function Manager(VNFM)*** and Controller. This separation was originally recommended by ETSI, and it effectively corresponds to two very different levels of abstraction that is important to be kept separate;
* ***[Infrastructure Abstraction](https://github.com/sonata-nfv/son-sp-infrabstract):*** hides the complexity and diversity of having to deal with multiple VIMs and WIMs;
* ***[Repositories](https://github.com/sonata-nfv/son-catalogue-repos):*** stores and manages service and function records, resulting from the instantiation, update and termination processes;
* ***[Monitoring](https://github.com/sonata-nfv/son-catalogue-repos):*** collects (via [monitoring probes](https://github.com/sonata-nfv/son-monitor-probe)), stores and provides monitoring data for the services and functions instances.

These are the highest level modules. Further details on each one of them can be found in each one of those modules GitHub's repositories.

### SDK

The service development kit (SDK) consists of the following main modules:

* ***[CLI](https://github.com/sonata-nfv/son-cli)***: SONATA SDK's command line interface tools to aid in developing network services and VNFs
* ***[Editor](https://github.com/sonata-nfv/son-editor)***: SONATA's web-based editor for service and function descriptors. The [Editor frontend](https://github.com/sonata-nfv/son-editor-frontend) and [Editor backend](https://github.com/sonata-nfv/son-editor-backend) are the frontend and backend of SONATA's web-based service and function descriptor editor.
* ***[Emulator](https://github.com/sonata-nfv/son-emu)***: emulation platform to support network service developers in locally prototyping and testing complete network service chains in realistic end-to-end multi-PoP scenarios
* ***[Analyzer](https://github.com/sonata-nfv/son-analyze)***: analysis framework to study a service's behaviour

### VnV

The Validation and Verification (VnV) platform consist of the following modules:

* ***[Gatekeeper](https://github.com/sonata-nfv/tng-gtk-vnv)***: This is the 5GTANGO Gatekeeper Verification and Validation platform specific components repository, which closely follows its SP Platform counterpart.
* ***[Lifecycle Manager](https://github.com/sonata-nfv/tng-vnv-lcm)***: This is a 5GTANGO component to coordinate the verification and validation activities of 5G Network Services.
* ***[Test Execution Engine](https://github.com/sonata-nfv/tng-vnv-tee)***: This is a 5GTANGO component to execute the test suites for 5G Network Services.

## 3. Release Notes

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
* Minor bugfixes.

#### tng-probes
* moongen: The MoonGen probe based on the MoonGen packet generator
* uperf: Network probe based on uperf network performance tool
* owamp: (one-way active measurement protocol) to Prometheus
* wrk: HTTP benchmarking tool based mostly on wrk

#### son-sp-infrabstract
* Cloud-init support for HEAT based stacks
* Scaling out support for HEAT based stacks
* Minor bugfixes

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
* Re-deploy network services without emulator retart
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

# [4. Component Installation](/component_installation)

# [5. Administration and User guide](/start_using)
