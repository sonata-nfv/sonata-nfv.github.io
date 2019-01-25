<p align="center"><img src="https://github.com/sonata-nfv/tng-api-gtw/wiki/images/sonata-5gtango-logo-500px.png" /></p>

# Validation & Verification Platform Installation Guide

The V&V Platform is the component of 5GTANGO responsible for validation and the verification of services using the supplied service tests.

## Install Steps

To install and configure V&V follow these instructions:
* Download and setup [Linux ubuntu = 16.04](http://releases.ubuntu.com/16.04/)
* Ensure you have a docker engine [Docker > 17.12.0-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
* Ensure environment has [Git](https://git-scm.com/download/linux) installed.

### Recommended Server requirements to deploy V&V

* **CPU:** 4 cores
* **Memory:** 8 GB
* **Disk:** 80 GB

### Docker Installation

```bash
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
```

### Git installation

```bash
sudo apt-get install git
```

## Installing V&V


### Installing from code

To have it up and running from code, please do the following:

```shell
$ git clone https://github.com/sonata-nfv/tng-vnv-lcm.git # Clone this repository
$ cd tng-vnv # Go to the newly created folder
$ bundle install # Install dependencies
$ PORT=5000 bundle exec rackup # dev server at http://localhost:5000
```

Everything being fine, you'll have a server running on that session, on port `5000`. You can use it by using `curl`, like in:

```shell
$ curl <host name>:5000/
```

### Installing from the Docker container
In case you prefer a `docker` based development, you can run the following commands (`bash` shell):

```shell
$ docker network create tango
$ docker run -d -p 27017:27017 --net=tango --name mongo mongo
$ docker run -d -p 4011:4011 --net=tango --name tng-cat sonatanfv/tng-cat:dev
$ docker run -d -p 4012:4012 --net=tango --name tng-rep sonatanfv/tng-rep:dev
$ docker run -d -p 5000:5000 --net=tango --name tng-gtk-vnv \
  -e CATALOGUE_URL=http://tng-cat:4011/catalogues/api/v2 \
  -e REPOSITORY_URL=http://tng-cat:4012 \
  sonatanfv/tng-gtk-vnv:dev
```


###Verify that V&V is running

```shell
$ docker inspect -f '{{.State.Running}}' tng-gtk-vnv
$ docker inspect -f '{{.State.Running}}' tng-vnv-lcm
$ docker inspect -f '{{.State.Running}}' tng-vnv-tee
$ docker inspect -f '{{.State.Running}}' tng-vnv-platform-adapter