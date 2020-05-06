# The path(s) where PowerShell will search for module folders:
$env:PsModulePath
$env:PsModulePath -Split ";"  #To see them easier.


# Get the currently-loaded root modules:
Get-Module


# A nested module is loaded by another module.
# Get currently-loaded modules and their nested modules:
Get-Module -All


# Get modules which are available to loaded (found in $env:PsModulePath):
Get-Module -ListAvailable


# Get available modules and show their drive paths:
Get-Module -ListAvailable -All


# Import an available module (if found in $env:PsModulePath):
Import-Module -Name PKI


# Import a script or binary module with an explicit path:
Import-Module -Name .\scriptmodule.psm1
Import-Module -Name .\binarymodule.dll


# Import one or more modules through a manifest:
Import-Module -Name .\manifest.psd1


# Import a module with the path to the module's folder (not found in $env:PsModulePath):
Import-Module -Name C:\SomeFolder 


# Show the commands provided by a particular module:
Get-Command -Module PKI




