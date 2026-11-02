# Step 3: Storage account with a blob container

This sample introduces nested resources and shows how a Bicep template can create more than one resource in a single deployment.

## What you will learn

- how to define nested resources
- how the `parent` property links child resources and creates the dependency for you (no `dependsOn` needed)
- how to create a storage account and a blob container together

## Files in this sample

- `main.bicep` - the template
- `main.bicepparam` - sample parameter values
- `deploy-cli.sh` - Azure CLI deployment script
- `deploy.ps1` - PowerShell deployment script

## Deploy with Azure CLI

```bash
az login
az group create --name rg-bicep-lab --location eastus
az deployment group create \
  --resource-group rg-bicep-lab \
  --template-file ./main.bicep \
  --parameters ./main.bicepparam
```

## Deploy with PowerShell

```powershell
az login
az group create --name rg-bicep-lab --location eastus
az deployment group create `
  --resource-group rg-bicep-lab `
  --template-file ./main.bicep `
  --parameters ./main.bicepparam
```

## Challenge

Change the `containerName` parameter and redeploy. Then verify the new container appears in the storage account.
