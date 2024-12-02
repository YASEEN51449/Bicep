var prefix = 'dev'
// var storageName = '${prefix}varstoragebcp'
var regions =[
  'eastus'
  'southeastasia'
  'northeurope'
]
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = if(prefix=='prod'){
  // name: '${storageName}${i}'
  name:'uniq'
  location: last(regions)
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
   properties:{
    accessTier:'Hot'
   } 
}
resource storageAccount1 'Microsoft.Storage/storageAccounts@2023-05-01' = if(prefix=='dev'){
  // name: '${storageName}${i}'
  name:'uniqdev'
  location: first(regions)
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
   properties:{
    accessTier:'Hot'
   } 
}


// az group create -g Demo1 -l westus3
// az deployment group create -g Demo1 -f if.bicep
