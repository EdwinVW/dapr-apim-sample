$response = Invoke-WebRequest "https://management.azure.com/subscriptions/$env:AZ_SUBSCRIPTION_ID/resourceGroups/$env:AZ_RESOURCE_GROUP/providers/Microsoft.ApiManagement/service/$env:APIM_SERVICE_NAME/subscriptions/master/listSecrets?api-version=2019-12-01" `
    -Method "POST" `
    -Body '{}' `
    -Headers @{ "Content-Type" = "application/json"; "If-Match" = "*"; "Authorization" = "Bearer $env:AZ_API_TOKEN" } `
    -UseBasicParsing | ConvertFrom-Json

$response.primaryKey
