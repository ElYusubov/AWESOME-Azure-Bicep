@description('Location for all resources.')
param location string = resourceGroup().location

@description('Globally unique storage account name (3-24 lowercase letters and numbers). Defaults to a unique value based on the resource group.')
@minLength(3)
@maxLength(24)
param storageAccountName string = 'st02${uniqueString(resourceGroup().id)}'

@description('Environment name for tags and naming.')
@allowed([
  'dev'
  'test'
  'prod'
])
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
    allowBlobPublicAccess: false
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
output environment string = environment