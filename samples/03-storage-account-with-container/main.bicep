@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the storage account.')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Blob container name.')
param containerName string = 'learningcontainer'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  name: '${storageAccountName}/default/${containerName}'
  dependsOn: [
    storageAccount
  ]
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
output containerName string = containerName
