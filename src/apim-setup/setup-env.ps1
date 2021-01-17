# Make sure you make a copy the env-sample.json and name it env.json
# Set the required variables in the env.json file.
# The env.json file is never pushed to GitHub!!

$vars = Get-Content ./env.json | ConvertFrom-Json

$env:APIM_SERVICE_NAME = $vars.apimServiceName
$env:AZ_SUBSCRIPTION_ID = $vars.apimSubscriptionId
$env:AZ_RESOURCE_GROUP= $vars.apimResourceGroup

$env:AZ_API_TOKEN = az account get-access-token --resource=https://management.azure.com --query accessToken --output tsv
