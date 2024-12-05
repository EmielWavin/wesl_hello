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
Building the application should work.

## Running the application on WESL
A simple test is to copy the executable onto a USB stick and mount it to WESL Linux.
Example how to mount is shown below.
```
# Create mountpoint
mkdir /mnt/usb
# Mount USB device, found at /dev/sda1 in this case
mount /dev/sda1 /mnt/usb
# Due to security the device is mounted as read-only copy the file to /home/root/bin
cd /mnt/usb
cp wesl_hello /home/root/bin/
# Set permission to run the application
cd /home/root/bin
chmod +x wesl_hello
./wesl_hello
Hello, wesl!