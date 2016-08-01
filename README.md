# meteor-deploy
Various scripts to assist with configuring Meteor.js servers and deploying applications

## Environment

These scripts have been developed for the following environment,
+ Ubuntu Server 14.04 LTS
+ Node.js v4.4.7 LTS
+ Meteor 1.4 (confirm)

## Testing 

These scripts have been tested in the following environments,
+ VMware Workstation Player 12 (for Windows)
+ GitBash for Windows 10

Future testing to be completed on,
+ Amazon Web Services

## Usage (VMware)

### Install the scripts

Install the scripts on the management machine by entering,

```
  git clone https://github.com/patrickcberry/meteor-deploy
```

### Create a virtual machine

Creating a VMware virtual machine will not be described here in detail. Either,
+ Copy an existing Ubuntu 14.04 LTS template VM, or
+ Create a new Virtual Machine in VMWare Workstation and install the OS from the Ubuntu 14.04 ISO

### Generate SSH keys

From the ```meteor-deploy``` folder enter the following command to create a directory to store keys, 
```mkdir ../keys```

In the project folder run the following script to generate RSA keys,
``` sh keygen.sh ../keys/my-key-file-name```

Copy the public key to the server,

``` --- to be completed --- ```


