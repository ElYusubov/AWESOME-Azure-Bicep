#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="${1:-rg-bicep-demo}"
LOCATION="${2:-eastus}"
STORAGE_ACCOUNT_NAME="${3:-stgdemobicep001}"

az login
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ./main.bicep \
  --parameters ./main.bicepparam \
  --parameters storageAccountName="$STORAGE_ACCOUNT_NAME"

az storage account show \
  --name "$STORAGE_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query name -o tsv
