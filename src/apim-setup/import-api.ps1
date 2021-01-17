az apim api import --path / `
                   --api-id eShopAPI `
                   --subscription $env:AZ_SUBSCRIPTION_ID `
                   --resource-group $env:AZ_RESOURCE_GROUP `
                   --service-name $env:APIM_SERVICE_NAME `
                   --display-name "eShop API" `
                   --protocols http https `
                   --subscription-required true `
                   --specification-path eshop-api.yaml `
                   --specification-format OpenApi