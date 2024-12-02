resource vnet 'Microsoft.Network/virtualNetworks@2024-03-01'={
  name:'devnet'
  location:resourceGroup().location
  properties:{
    addressSpace:{
      addressPrefixes:[
      '10.0.0.0/21'
      ]
    }
  }
}
// az deployment group create -g Demo1 -f vnet.bicep
