targetScope = 'subscription'
var rgName ='DeployedFromDemo1'
resource myNewGroup 'Microsoft.Resources/resourceGroups@2024-07-01'={
  name: rgName
location:'southeastasia'}

module storageModule 'storagemod.bicep'={
  name:'storageModule'
  name:'storageModule'
  scope:resourceGroup(myNewGroup.name)
  params:{
    storageName:'modulestore1'}
}
