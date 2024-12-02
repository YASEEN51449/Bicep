module storageModule 'storagemod.bicep'={
  name:'storageModule'
  params:{
    storageName:'modulestore1'}
}
//az deployment group create -g Demo1 -f stormodscript.bicep
