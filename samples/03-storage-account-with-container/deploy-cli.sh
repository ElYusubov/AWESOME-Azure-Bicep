#!/usr/bin/env bash
# Usage: ./deploy-cli.sh [resourceGroup] [location] [storageAccountName] [containerName]
# Empty name arguments let the template generate globally unique names.
set -euo pipefail

RESOURCE_GROUP="${1:-rg-bicep-lab}"
LOCATION="${2:-eastus}"
STORAGE_ACCOUNT_NAME="${3:-}"
CONTAINER_NAME="${4:-learningcontainer}"

OVERRIDES=()
if [ -n "$STORAGE_ACCOUNT_NAME" ]; then OVERRIDES+=("storageAccountName=$STORAGE_ACCOUNT_NAME"); fi
if [ -n "$CONTAINER_NAME" ]; then OVERRIDES+=("containerName=$CONTAINER_NAME"); fi

az login
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ./main.bicep \
  --parameters ./main.bicepparam ${OVERRIDES[@]+--parameters "${OVERRIDES[@]}"} \
  --query properties.outputs
