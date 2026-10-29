param(
    [string]$ResourceGroup = 'rg-bicep-lab',
    [string]$Location = 'eastus',
    [string]$StorageAccountName = 'stgdemobicep004',
    [string]$WebAppName = 'appdemobicep004',
    [string]$ContainerName = 'learningcontainer'
)

$ErrorActionPreference = 'Stop'

az login
az group create --name $ResourceGroup --location $Location | Out-Null
az deployment group create `
  --resource-group $ResourceGroup `
  --template-file ./main.bicep `
  --parameters ./main.bicepparam `
  --parameters storageAccountName=$StorageAccountName webAppName=$WebAppName containerName=$ContainerName
