# Lab VM Setup Guide

## Lab Machine Software Requirements:

| Software                                                  | Link                                                                                    |
| --------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| Visual Studio Code                                        | https://code.visualstudio.com/                                                          |
| Visual Studio Code Azure Account Extension                | https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account             |
| Visual Studio Code Azure Resource Manager Tools Extension | https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools |
| Visual Studio Code Azure CLI Tools Extension              | https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli                  |
| Visual Studio Code PowerShell Extension                   | https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell                |
| Visual Studio Code C# Extension                           | https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp                    |
| Azure PowerShell                                          | https://docs.microsoft.com/powershell/azure/install-az-ps                               |
| Azure CLI                                                 | https://docs.microsoft.com/cli/azure/install-azure-cli                                  |
| Azure Storage Explorer                                    | https://azure.microsoft.com/features/storage-explorer/                                  |
| Git for Windows                                           | https://git-scm.com/download/win                                                        |
| Git Extensions                                            | http://gitextensions.github.io                                                          |
| .NET 5 SDK, .NET Core 3.1 SDK                             | https://dotnet.microsoft.com/download                                                   |
| Docker Desktop                                            | https://www.docker.com/products/docker-desktop                                          |
| Node.js 12.20.0                                           | https://nodejs.org/download/release/v10.23.0/                                           
| Azure DocumentDB Data Migration Tool                       | https://www.microsoft.com/en-us/download/confirmation.aspx?id=46436


## <a id="basics">Create VM</a>

This is a semi-automated guide for a Azure Lab VM Setup.

In order for Docker to work on a Windows 10 VM you need to install Hyper-V or use Windows Subsystem for Linux 2 (WSL2). Therefore you must use hardware that supports [Nested Virtualization](https://docs.microsoft.com/en-us/azure/lab-services/how-to-enable-nested-virtualization-template-vm). 


You can run the following remote script in Azure Cloud Shell **bash**

- https://shell.azure.com/bash/

```bash
curl https://raw.githubusercontent.com/SuperUsersDK/automation/main/Setup/create-lab-vm.sh | bash
```



## Connect to VM

Go to Ressource Group `az204-lab` and connect to VM using RDP and the credentials that you have used in the script:

Credentials:

```
user=sysadmin
pwd=Lab@dmin1234
```


## Install Software

To install Software run the script `setup-az-204.ps1` from an elevated PowerShell prompt:


```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/SuperUsersDK/automation/master/Setup/setup-az-204.ps1'))
```

> Note: This script will run for approx 20 min. No need to wait!

Congratulations you have completed the base setup of a labs vm!

---






---

## Setup Docker Support

There are two options to configure Docker support. WSL2 recommended

### Option 1 - Install Docker with Hyper-V (Skip for now)

Install Hyper-V using `setup-docker.ps1` and restart after execution.


---

### Option 2 - Install Docker with WSL2 (Use Today)

#### <a id="wsl">Install WSL2</a>

Execute script `setup-wsl2.ps1` multible times to setup WSL2. 
Reboot between first and second run.

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/SuperUsersDK/automation/master/Setup/setup-wsl2.ps1'))
```

First Run:

> Note: must fail, but continue anyway

Second Run:


After the second run your selected linux distro (select "1" for "Ubuntu 20.04") will be opened an you can set your username:sysadmin and password

> Note: You can take the same credentials just like on the Windows VM

```
Select: 
1 : Ubuntu 20.04 
2 : Ubuntu 18.04
3 : Ubuntu 16.04
4 : Debian
5 : Kali
6 : OpenSUSE Leap 42
7 : SUSE Linux Enterprise Server 1
8 : Alpine
```


> Note: Logoff Windows VM 

### Test Docker Installation

In "Windows PowerShell" Terminal test docker command

```
docker run hello-world
```


