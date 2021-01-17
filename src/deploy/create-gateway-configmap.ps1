kubectl delete configmap eshop-apim-gateway-env -n dapr-apim-sample --ignore-not-found

kubectl create configmap eshop-apim-gateway-env -n dapr-apim-sample --from-literal `
     "config.service.endpoint=https://$env:APIM_SERVICE_NAME.management.azure-api.net/subscriptions/$env:AZ_SUBSCRIPTION_ID/resourceGroups/$env:AZ_RESOURCE_GROUP/providers/Microsoft.ApiManagement/service/$env:APIM_SERVICE_NAME?api-version=2019-12-01"