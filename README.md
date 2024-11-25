#Storage.bicep

    resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
    name: 'storagebcp1'
    location: 'westus3'
    sku: {
    name: 'Standard_LRS'
    }
    kind:'StorageV2'
     properties:{
      accessTier:'Hot'
     } 
      }
**************************************Deployment *****************
        
    az group create -g Demo1 -l westus3
    az deployment group create -g Demo1 -f storage.bicep
