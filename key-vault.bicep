@description('Key Vault name')
param keyVaultName string = 'my-key-vault'

@description('Access policies for the Key Vault')
param accessPolicies array = []

@description('Key Vault tags')
param tags object = {}

@description('Key Vault SKU')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@description('Are you creating a new Key Vault?')
param createKeyVault bool = false

@description('Resource group name, use default value')
param resourceGroupName string = resourceGroup().name

@description('Resource location, use default value from resource group location')
param location string = resourceGroup().location

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault.')
param tenantId string = subscription().tenantId

var createMode = createKeyVault ? 'default' : 'recover'

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: skuName
    }
    createMode: createMode
    tenantId: tenantId
    accessPolicies: []
  }
  tags: tags
}

resource kvPolicies 'Microsoft.KeyVault/vaults/accessPolicies@2023-02-01' = {
  name: 'add'
  parent: kv
  properties: {
    accessPolicies: accessPolicies
  }
}
