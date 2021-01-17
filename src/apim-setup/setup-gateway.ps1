Invoke-WebRequest "https://management.azure.com/subscriptions/$env:AZ_SUBSCRIPTION_ID/resourceGroups/$env:AZ_RESOURCE_GROUP/providers/Microsoft.ApiManagement/service/$env:APIM_SERVICE_NAME/gateways/eshop-apim-gateway?api-version=2019-12-01" `
     -Method "PUT" `
     -Body '{"properties": {"description": "Dapr Gateway","locationData": {"name": "Virtual"}}}' `
     -Headers @{ "Content-Type" = "application/json"; "If-Match" = "*"; "Authorization" = "Bearer $env:AZ_API_TOKEN" } `
     -UseBasicParsing

Invoke-WebRequest "https://management.azure.com/subscriptions/$env:AZ_SUBSCRIPTION_ID/resourceGroups/$env:AZ_RESOURCE_GROUP/providers/Microsoft.ApiManagement/service/$env:APIM_SERVICE_NAME/gateways/eshop-apim-gateway/apis/eShopAPI?api-version=2019-12-01" `
     -Method "PUT" `
     -Body '{ "properties": { "provisioningState": "created" } }' `
     -Headers @{ "Content-Type" = "application/json"; "If-Match" = "*"; "Authorization" = "Bearer $env:AZ_API_TOKEN" } `
     -UseBasicParsing     
