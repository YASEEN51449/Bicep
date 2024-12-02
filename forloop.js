var prefix = 'interpol'
var storageName = '${prefix}varstoragebcp1'
var regions =[
  'eastus'
  'southeastasia'
  'northeurope'
]
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = [for region in regions :{
  name: storageName
  location: region
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
   properties:{
    accessTier:'Hot'
   } 
}
]

// az group create -g Demo1 -l westus3
// az deployment group create -g Demo1 -f interpolvar.bicep
