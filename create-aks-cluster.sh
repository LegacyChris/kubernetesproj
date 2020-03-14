# connect to Azure via Azure CLI
az login

# create variables
# AksName="aks-k8s-extia"
# AksRG="aks-k8s-extia"

# Create resource group
az group create \
   --location westeurope \ 
   --subscription "MSDN Platforms Subscription" \
   --name aks-k8s-rg 

# create AKS cluster
az aks create \
   --generate-ssh-keys \
   --subscription "MSDN Platforms Subscription" \
   --node-count 3 \
   --resource-group aks-k8s-rg \
   --name aks-k8s

# connect to cluster
az aks get-credentials \
   --resource-group aks-k8s-rg \
   --name aks-k8s \
   --subscription "MSDN Platforms Subscription"

# get access to Dashboard
kubectl create clusterrolebinding kubernetes-dashboard \
        --clusterrole=cluster-admin \
        --serviceaccount=kube-system:kubernetes-dashboard

# Open Dashboard
az aks browse \
   --resource-group aks-k8s-rg \
   --name aks-k8s \
   --subscription "MSDN Platforms Subscription" 