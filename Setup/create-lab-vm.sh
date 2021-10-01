#/bin/bash

# Any Random string to avoid conflict with other name
# Naming things is a complex task :-) 
rnd=$RANDOM

# location close to home
loc=westeurope

# one resourcegroup only for vm resources
grp=az204-lab

# Windows computer name cannot be more than 15 characters long
vmname=labvm-$rnd

# root and administrator is taken
user=sysadmin

# The password length must be between 12 and 123. Password must have the 3 of the following: 1 lower case character, 1 upper case character, 1 number and 1 special character.
pwd=Lab@dmin1234

# Remember to support WSL2 you must have at least patch level 20h2
vmimage="MicrosoftWindowsDesktop:Windows-10:21h1-pron:19043.1237.2109130412"


# ref https://docs.microsoft.com/en-us/azure/virtual-machines/sizes
# Size: Standard E2s v3 (2 vcpus, 16 GiB memory)
size=Standard_E2s_v3

az group create -n $grp -l $loc

az vm create -g $grp -n $vmname --admin-username $user --admin-password $pwd  --image  $vmimage --size $size --public-ip-sku Standard

az vm auto-shutdown -g $grp -n $vmname --time 1730


