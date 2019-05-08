# Descriptors creation

The recommended workflow when developing a SONATA network service consists on using the CLI tools to create a workspace, create a project to hold the descriptors of the service, validate the components and finally, create a bundled service package. The required steps are as follows:

-   Step 1: Create Workspace (only required once)

```bash
# setup workspace at default location (~/.tng-workspace)
tng-workspace

# setup workspace at custom path
tng-workspace --workspace path/to/workspace
````

-   Step 2: Create Project

```bash
tng-project -p path/to/project                # creates a new project at the specified path
tng-project -p path/to/project --add file1    # adds file1 to the project.yml
tng-project -p path/to/project --add file1 --type text/plain  # adds file1 with explicit MIME type
tng-project -p path/to/project --remove file1 # removes file1 from the project.yml
tng-project -p path/to/project --status       # shows project overview/status
````

It's also possible to directly generate suitable VNFD and NSD descriptors when creating a new project:

```bash
# creates a new project with descriptors for 2 VNFs with the specified author and images
tng-project -p path/to/project --author abc --vnfs 2 \  
  --image_names img1 img2 --image_types docker docker     
```

NOTE: Since the structure of projects and descriptors changed from SONATA (v3.1) to 5GTANGO (v4.0), tng-project also provides a command to automatically translate old to new projects. For more information see the corresponding wiki page.

```bash
tng-project -p path/to/old-project --translate   # translates the project to the new structure
````


# Validation 

To validate your project do:

```sh
tng-sdk-validate -t --project  <our_5gtango_project_path>
```

# Package Creation

The tng-sdk-package will create the .tgo package file.

```
tng-pkg -p misc/5gtango_ns_project_example1		# package a 5GTANGO SDK project

tng-pkg -u misc/5gtango-ns-package-example.tgo		# unpack a 5GTANGO package to a local 5GTANGO SDK project
```

# Package on-boarding

For uploading a package to a Service platform you can use this curl command:

```
curl -v -i -X POST  -F "package=@./your_package.tgo" http://your_service_platform_ip:320
02/api/v3/packages
````

Once uploaded, you will have your package available in the dashboard deady to deploy.
