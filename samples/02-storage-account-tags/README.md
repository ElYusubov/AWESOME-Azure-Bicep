# Step 2: Storage account with tags

This sample adds tagging and a simple environment parameter to the basic storage account template.

## What you will learn

- how to use a `var` block
- how to pass environment-based values into a deployment
- how to add metadata to Azure resources with tags

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

Try changing the `environment` value from `dev` to `prod` and redeploying. Then inspect the tags on the resource in Azure Portal or Azure CLI.
