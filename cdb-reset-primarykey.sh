#!/bin/bash
SUBSCRIPTION_ID=`az account show --query id --output tsv`
az cosmosdb list | jq ".[] | .name, .resourceGroup" | xargs -n 2 | while read CDB_ACCOUNT_NAME RSG_NAME ; do
  echo "az cosmosdb keys regenerate --key-kind primary --name $CDB_ACCOUNT_NAME --resource-group $RSG_NAME --subscription $SUBSCRIPTION_ID"
done # | sh -x
