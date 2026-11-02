# Usage: ./deploy.ps1 [-ResourceGroup <name>] [-Location <region>] [-StorageAccountName <value>]
# Leave name parameters empty to let the template generate globally unique names.
param(
    [string]$ResourceGroup = 'rg-bicep-demo',
    [string]$Location = 'eastus',
    [string]$StorageAccountName = ''
)

$ErrorActionPreference = 'Stop'

$overrides = @()
if ($StorageAccountName) { $overrides += "storageAccountName=$StorageAccountName" }

$deployArgs = @(
    '--resource-group', $ResourceGroup,
    '--template-file', './main.bicep',
    '--parameters', './main.bicepparam'
)
if ($overrides) { $deployArgs += @('--parameters') + $overrides }

az login
az group create --name $ResourceGroup --location $Location | Out-Null
az deployment group create @deployArgs --query properties.outputs
