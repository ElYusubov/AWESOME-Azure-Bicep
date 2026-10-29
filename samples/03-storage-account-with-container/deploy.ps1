param(
    [string]$ResourceGroup = 'rg-bicep-lab',
    [string]$Location = 'eastus',
    [string]$StorageAccountName = 'stgdemobicep003',
    [string]$ContainerName = 'learningcontainer'
)

$ErrorActionPreference = 'Stop'

az login
az group create --name $ResourceGroup --location $Location | Out-Null
az deployment group create `
  --resource-group $ResourceGroup `
  --template-file ./main.bicep `
  --parameters ./main.bicepparam `
  --parameters storageAccountName=$StorageAccountName containerName=$ContainerName
