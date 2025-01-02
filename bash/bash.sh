#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Azure credentials
AZURE_CLIENT_ID="61c9c460-5ca5-42ea-99f4-507acdcbea21"
AZURE_CLIENT_SECRET="35516f28-0de9-4297-a5d4-5408cda92a66"
AZURE_TENANT_ID="a2bd4167-a08c-4878-828e-d9ea769bc007"
DATABRICKS_HOST="workspace_testing_001"

# Log into Azure
echo "Logging into Azure with Service Principal..."
az login --service-principal \
  --username "$AZURE_CLIENT_ID" \
  --password "$AZURE_CLIENT_SECRET" \
  --tenant "$AZURE_TENANT_ID"

# Fetch an AAD Token for Databricks
echo "Fetching AAD Token for Databricks..."
DATABRICKS_TOKEN=$(az account get-access-token --resource https://databricks.azure.com --query accessToken -o tsv)

# Install the Databricks CLI if not already installed
echo "Installing Databricks CLI..."
pip install --quiet databricks-cli

# Set Databricks environment variables
export DATABRICKS_HOST
export DATABRICKS_TOKEN

# Run a Databricks operation
echo "Running Databricks operation: Listing clusters..."
databricks clusters list