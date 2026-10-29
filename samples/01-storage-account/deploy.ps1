param(
    [string]$ResourceGroup = 'rg-bicep-demo',
    [string]$Location = 'eastus',
    [string]$StorageAccountName = 'stgdemobicep001'
)

$ErrorActionPreference = 'Stop'

az login
az group create --name $ResourceGroup --location $Location | Out-Null
az deployment group create `
  --resource-group $ResourceGroup `
  --template-file ./main.bicep `
  --parameters ./main.bicepparam `
  --parameters storageAccountName=$StorageAccountName

az storage account show `
  --name $StorageAccountName `
  --resource-group $ResourceGroup `
  --query name -o tsv
