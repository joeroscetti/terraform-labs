#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Azure credentials
AZURE_CLIENT_ID="5db4da55-82ec-4920-af14-db3eb20fbb7a"
AZURE_CLIENT_SECRET="1Jp8Q~xJ4JnKBYxBw1UK9.7Ang-w8sz5iZDYidsQ"
AZURE_TENANT_ID="a2bd4167-a08c-4878-828e-d9ea769bc007"
DATABRICKS_HOST="https://adb-2749952475382083.3.azuredatabricks.net"

# Log into Azure
echo "Logging into Azure with Service Principal..."
az login --service-principal \
  --username "$AZURE_CLIENT_ID" \
  --password "$AZURE_CLIENT_SECRET" \
  --tenant "$AZURE_TENANT_ID"




# Install the Databricks CLI if not already installed
echo "Installing Databricks CLI..."
pip install --quiet databricks-cli


 az databricks workspace list --resource-group databricks --subscription c4a823f7-1f8c-40f0-9ba8-16e520b2144a
