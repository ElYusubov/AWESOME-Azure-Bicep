#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="${1:-rg-bicep-lab}"
LOCATION="${2:-eastus}"
STORAGE_ACCOUNT_NAME="${3:-stgdemobicep002}"
ENVIRONMENT="${4:-dev}"

az login
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ./main.bicep \
  --parameters ./main.bicepparam \
  --parameters storageAccountName="$STORAGE_ACCOUNT_NAME" environment="$ENVIRONMENT"
