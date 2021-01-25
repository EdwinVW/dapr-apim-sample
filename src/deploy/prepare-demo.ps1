cd ../apim-setup
& ./setup-env.ps1
cd ../deploy
& ./create-namespace.ps1
& ./install-redis.ps1
& ./create-gateway-configmap.ps1
& ./create-gateway-key-secret.ps1