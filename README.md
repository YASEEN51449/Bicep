# 1.Storage.bicep

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
      
**Deployment**
        
    az group create -g Demo1 -l westus3
    az deployment group create -g Demo1 -f storage.bicep

# 2.VarStorage.bicep

    var storageName = 'varstoragebcp1'
    resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
    name: storageName
    location: 'eastus'
    sku: {
    name: 'Standard_LRS'
    }
    kind:'StorageV2'
    properties:{
    accessTier:'Hot'
    } 
    }
**VarStorage.bicep Deployment**
        
    az group create -g Demo1 -l westus3
    az deployment group create -g Demo1 -f var.bicep

# 3.Interpolvar.bicep

    var prefix = 'interpol'
    var storageName = '${prefix}varstoragebcp1'
    resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
      name: storageName
      location: 'eastus'
      sku: {
        name: 'Standard_LRS'
      }
      kind:'StorageV2'
       properties:{
        accessTier:'Hot'
       } 
    }

**interpolvar.bicep**
        
    az group create -g Demo1 -l westus3
    az deployment group create -g Demo1 -f interpolvar.bicep

    
# 4.Forloop.bicep

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

**for loop deployment**
    
    az group create -g Demo1 -l westus3
    az deployment group create -g Demo1 -f forloop.bicep

# 5.If Condition

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


**for loop deployment**

     az group create -g Demo1 -l westus3
     az deployment group create -g Demo1 -f if.bicep


