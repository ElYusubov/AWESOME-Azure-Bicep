#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="${1:-rg-bicep-lab}"
LOCATION="${2:-eastus}"
STORAGE_ACCOUNT_NAME="${3:-stgdemobicep004}"
WEB_APP_NAME="${4:-appdemobicep004}"
CONTAINER_NAME="${5:-learningcontainer}"

az login
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ./main.bicep \
  --parameters ./main.bicepparam \
  --parameters storageAccountName="$STORAGE_ACCOUNT_NAME" webAppName="$WEB_APP_NAME" containerName="$CONTAINER_NAME"
