kubectl apply `
    -f ./config.yaml `
    -f ./pubsub-redis.yaml `
    -f ./customer-service.yaml `
    -f ./apim-gateway.yaml