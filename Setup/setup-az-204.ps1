
Write-Host "Automation Setup for Developing Solutions for Microsoft Azure --> https://www.superusers.dk/kursus/az0204/ "

Write-Host "Installing scoop (PowerShell Package Manager)" -ForegroundColor yellow

# Install scoop (powershell package manager)
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

scoop install 7zip 
scoop install git 
scoop install gitignore
scoop install sudo 
scoop install touch
scoop install azure-cli 
scoop install python

# install http, because curl is not for humans
pip install httpie

# Add GUI Tools
scoop bucket add extras
scoop install googlechrome 
scoop install vscode
scoop install win32-openssh 
scoop install pwsh
scoop install concfg 
scoop install gow 
scoop install vim 
scoop install starship
scoop install windows-terminal


# Install chocolatey
Write-Host "Installing Chocolatey (Windows Package Manager)" -ForegroundColor yellow

Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


choco install gitextensions -y
choco install dotnetcore-sdk -y
choco install dotnet-5.0-sdk -y
choco install nodejs-lts --version=12.18.4 -y
choco install azure-functions-core-tools-3 --params="'/x64:true'" -y
choco install azurestorageemulator -y
choco install microsoftazurestorageexplorer -y
choco install azure-data-studio -y
choco install postman -y
choco install ngrok -y

# Refresh Path Env (a hack to refresh env:path)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install httprepl
dotnet tool install -g Microsoft.dotnet-httprepl
dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org

# Intall VS Code Extensions
Write-Host "Installing VS Code Extensions" -ForegroundColor yellow

code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.azure-account
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-azuretools.vscode-cosmosdb
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension ms-azuretools.vscode-azurestaticwebapps
code --install-extension GitHub.vscode-pull-request-github
code --install-extension redhat.vscode-yaml
code --install-extension bencoleman.armview
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension mdickin.markdown-shortcuts
code --install-extension mhutchie.git-graph 
code --install-extension humao.rest-client

# Install Angular
Write-Host "Installing Angular " -ForegroundColor yellow

npx @angular/cli@latest analytics off
npm install  @angular/cli --global


Write-Host "Installing NPM tools " -ForegroundColor yellow
npm install fkill-cli kill-tabs rimraf empty-trash-cli pen speed-test live-server http-server is-online-cli is-up-cli clipboard-cli --global



Write-Host "Finished Software installation" -ForegroundColor yellow
