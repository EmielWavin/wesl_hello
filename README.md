# wesl_hello 

## Building applications
To build the application on a Linux machine there is a buildscript that takes care of all building steps. 

[wesl_make script](scripts\wesl_make.sh)

### Setup SDK for building ARM applications

In order to make use of the x-compiling the SDK needs to be installed on the system. Populating the SDK can be done with:
```
bitbake core-image-wavin-ics -c populate_sdk
```

This will install the SDK to /opt/wavin/0.0.1


```
source /opt/wavin/0.0.1/environment-setup-cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi
```