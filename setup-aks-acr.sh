# Set your Azure subscription
az account set --subscription 2a3a58a1-8bf7-45eb-b8de-f0288565baf1

# Create a resource group (if you haven't already)
az group create --name myAKSRG --location eastus

# Create AKS cluster (free tier enabled)
az aks create \
    --resource-group myAKSRG \
    --name myAKSCluster \
    --node-count 2 \
    --enable-addons monitoring \
    --generate-ssh-keys \
    --sku F1

# Create ACR  (free tier enabled)
az acr create \
    --resource-group myAKSRG \
    --name myACR \
    --sku Basic \
    --admin-enabled true \
    --location eastus

# Authenticate with ACR
az acr login --name myACR

# Set AKS to Use ACR for Container Images
# Get ACR ID
ACR_ID=$(az acr show --name myACR --query id --output tsv)

# Update AKS to use ACR
az aks update \
    --name myAKSCluster \
    --resource-group myAKSRG \
    --attach-acr $ACR_ID
