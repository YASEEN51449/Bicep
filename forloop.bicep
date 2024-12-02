var prefix = 'for'
var storageName = '${prefix}varstoragebcp'
var regions =[
  'eastus'
  'southeastasia'
  'northeurope'
]
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = [for (region,i) in regions :{
  name: '${storageName}${i}'
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
// az deployment group create -g Demo1 -f forloop.bicep
