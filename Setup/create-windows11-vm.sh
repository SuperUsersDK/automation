#/bin/bash

# Any Random string to avoid conflict with other name
# Naming things is a complex task :-) 
rnd=$RANDOM

# location close to home
loc=westeurope

# one resourcegroup only for vm resources
grp=windows11-vm

# Windows computer name cannot be more than 15 characters long
vmname=labvm-$rnd

# root and administrator is taken
user=sysadmin

# The password length must be between 12 and 123. Password must have the 3 of the following: 1 lower case character, 1 upper case character, 1 number and 1 special character.
pwd=Lab@dmin1234

# Windows 11 
vmimage="MicrosoftWindowsDesktop:windows11preview:win11-21h2-pro:22000.194.2109250206"


# Size: Standard_D2s_v3 (2 vcpus, 8 GiB memory)
size=Standard_D2s_v3

az group create -n $grp -l $loc

az vm create -g $grp -n $vmname --admin-username $user --admin-password $pwd  --image  $vmimage --size $size

az vm auto-shutdown -g $grp -n $vmname --time 2230


