# SDK installation

The 5GTANGO SDK provide a set of tools to help NFV developers to create network service and VNF descriptors and package them.

## SDK TOOLS

The installation of the sdk components requires: Python 3.5+ and setuptools.

Best practice is to first create a fresh virtual environment and then install all SDK tools in this environment.

```sh
# find out the path to your python3
which python3
# create a fresh virtualenv
virtualenv -p <path_to_python3> venv
# activate the virtualenv
source venv/bin/activate
```

Install all SDK tools:

```sh
# install tng-sdk-project
pip install git+https://github.com/sonata-nfv/tng-sdk-project.git

# install tng-sdk-validator
pip3 install git+https://github.com/sonata-nfv/tng-sdk-validation.git

# install tng-sdk-package
pip3 install git+https://github.com/sonata-nfv/tng-sdk-package
```

Test the installation:

```sh
tng-project -h
tng-validate -h
tng-package -h
```

Continue with the [Quickguide](/quickguide).

Support channel:
[![Join the chat at https://gitter.im/sonata-nfv/Lobby](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/sonata-nfv/Lobby)