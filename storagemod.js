param storageName string
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageName
  location: 'westus3'
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
   properties:{
    accessTier:'Hot'
   } 
}

// az group create -g Demo1 -l westus3
// az deployment group create -g Demo1 -f storage.bicep
