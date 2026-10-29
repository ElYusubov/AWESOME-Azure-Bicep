@description('Location for all resources.')
param location string = resourceGroup().location

@description('Globally unique storage account name (3-24 lowercase letters and numbers). Defaults to a unique value based on the resource group.')
@minLength(3)
@maxLength(24)
param storageAccountName string = 'st04${uniqueString(resourceGroup().id)}'

@description('Name of the blob container in the storage account.')
param containerName string = 'learningcontainer'

@description('Globally unique name of the Azure Web App (becomes <name>.azurewebsites.net). Defaults to a unique value based on the resource group.')
@minLength(2)
@maxLength(60)
param webAppName string = 'app-${uniqueString(resourceGroup().id)}'

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

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
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

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
      minTlsVersion: '1.2'
      ftpsState: 'Disabled'
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
output webAppName string = webApp.name
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'