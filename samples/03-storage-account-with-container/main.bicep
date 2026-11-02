@description('Location for all resources.')
param location string = resourceGroup().location

@description('Globally unique storage account name (3-24 lowercase letters and numbers). Defaults to a unique value based on the resource group.')
@minLength(3)
@maxLength(24)
param storageAccountName string = 'st03${uniqueString(resourceGroup().id)}'

@description('Blob container name (3-63 lowercase letters, numbers, and hyphens).')
@minLength(3)
@maxLength(63)
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
    allowBlobPublicAccess: false
  }
}

// Child resources use 'parent' so Bicep builds the full name and the dependency automatically.
resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent: storageAccount
  name: 'default'
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  parent: blobService
  name: containerName
  properties: {
    publicAccess: 'None'
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
output containerName string = blobContainer.name