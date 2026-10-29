# Beginner storage account sample

This sample creates a basic Azure Storage account using Bicep.

## Files in this sample

- `main.bicep` - the deployment template
- `main.bicepparam` - parameter values for the sample
- `deploy-cli.sh` - Azure CLI example
- `deploy.ps1` - PowerShell example

## Deploy with Azure CLI

```bash
az login
az group create --name rg-bicep-demo --location eastus
az deployment group create \
  --resource-group rg-bicep-demo \
  --template-file ./main.bicep \
  --parameters ./main.bicepparam
```

## Deploy with PowerShell

```powershell
az login
az group create --name rg-bicep-demo --location eastus
az deployment group create `
  --resource-group rg-bicep-demo `
  --template-file ./main.bicep `
  --parameters ./main.bicepparam
```

You can also use the included scripts:

```bash
./deploy-cli.sh rg-bicep-demo eastus stgdemobicep001
```

```powershell
./deploy.ps1 -ResourceGroup 'rg-bicep-demo' -Location 'eastus' -StorageAccountName 'stgdemobicep001'
```

Use a globally unique storage name, so replace `stgdemobicep001` with a unique value if needed.

## What this sample teaches

- `param` blocks
- resource declarations
- `location` and `resourceGroup().location`
- simple `output` values
- how to pass parameter values with a `.bicepparam` file

## Next step

Try adding a tag, a new parameter, or a second resource such as a storage container.
