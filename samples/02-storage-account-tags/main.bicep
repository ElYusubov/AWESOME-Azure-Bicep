@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the storage account.')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Environment name for tags and naming.')
param environment string = 'dev'

var storageTags = {
  environment: environment
  workload: 'learning'
  managedBy: 'bicep'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: storageTags
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
output environment string = environment
