@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the storage account.')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Name of the blob container in the storage account.')
param containerName string = 'learningcontainer'

@description('Name of the Azure Web App.')
param webAppName string

@description('Name of the App Service plan.')
param appServicePlanName string = '${webAppName}-plan'

module storageModule 'modules/storage-with-container.bicep' = {
  name: 'storageModule'
  params: {
    location: location
    storageAccountName: storageAccountName
    containerName: containerName
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
      appSettings: [
        {
          name: 'STORAGE_ACCOUNT_NAME'
          value: storageModule.outputs.storageAccountName
        }
        {
          name: 'STORAGE_CONTAINER_NAME'
          value: storageModule.outputs.containerName
        }
      ]
    }
  }
}

output storageAccountName string = storageModule.outputs.storageAccountName
output containerName string = storageModule.outputs.containerName
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'
