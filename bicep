resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'pratik786'
  location: 'westus3'
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
   properties:{
    accessTier:'Hot'
   } 
}
