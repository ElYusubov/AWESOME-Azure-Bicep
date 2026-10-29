# Usage: ./deploy.ps1 [-ResourceGroup <name>] [-Location <region>] [-StorageAccountName <value>] [-WebAppName <value>] [-ContainerName <value>]
# Leave name parameters empty to let the template generate globally unique names.
param(
    [string]$ResourceGroup = 'rg-bicep-lab',
    [string]$Location = 'eastus',
    [string]$StorageAccountName = '',
    [string]$WebAppName = '',
    [string]$ContainerName = 'learningcontainer'
)

$ErrorActionPreference = 'Stop'

$overrides = @()
if ($StorageAccountName) { $overrides += "storageAccountName=$StorageAccountName" }
if ($WebAppName) { $overrides += "webAppName=$WebAppName" }
if ($ContainerName) { $overrides += "containerName=$ContainerName" }

$deployArgs = @(
    '--resource-group', $ResourceGroup,
    '--template-file', './main.bicep',
    '--parameters', './main.bicepparam'
)
if ($overrides) { $deployArgs += @('--parameters') + $overrides }

az login
az group create --name $ResourceGroup --location $Location | Out-Null
az deployment group create @deployArgs --query properties.outputs
