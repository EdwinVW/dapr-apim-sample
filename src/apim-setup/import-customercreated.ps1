Invoke-WebRequest "https://management.azure.com/subscriptions/$env:AZ_SUBSCRIPTION_ID/resourceGroups/$env:AZ_RESOURCE_GROUP/providers/Microsoft.ApiManagement/service/$env:APIM_SERVICE_NAME/apis/eShopAPI/operations/customercreated/policies/policy?api-version=2019-12-01" `
    -Method "PUT" `
    -InFile ./policies/customercreated.json `
    -Headers @{ "Content-Type" = "application/json"; "If-Match" = "*"; "Authorization" = "Bearer $env:AZ_API_TOKEN" } `
    -UseBasicParsing
