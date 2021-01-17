# Get API gateway key
$response = Invoke-WebRequest "https://management.azure.com/subscriptions/$env:AZ_SUBSCRIPTION_ID/resourceGroups/$env:AZ_RESOURCE_GROUP/providers/Microsoft.ApiManagement/service/$env:APIM_SERVICE_NAME/gateways/eshop-apim-gateway/generateToken?api-version=2019-12-01" `
    -Method "POST" `
    -Body '{ "properties": { "keyType": "primary", "expiry": "2021-01-18T00:00:01Z" } }' `
    -Headers @{ "Content-Type" = "application/json"; "If-Match" = "*"; "Authorization" = "Bearer $env:AZ_API_TOKEN" } `
    -UseBasicParsing | ConvertFrom-Json

$key = $response.value

# Create K8S secret containing the key
kubectl delete secret eshop-apim-gateway-token -n dapr-apim-sample --ignore-not-found
kubectl create secret generic eshop-apim-gateway-token -n dapr-apim-sample --type Opaque --from-literal value="GatewayKey $key"
