using keyVaultName string = 'my-key-vault'
param location string = resourceGroup().location
param tenantId string = subscription().tenantId

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard' 1 
    }
    createMode: 'default'
    tenantId: tenantId
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: 'c5bca52c-b293-4526-a30f-b41c40f5c334'
        permissions: {
          keys: [
            'all'
          ]
          secrets: [
            'get'
          ]
          certificates: [
            'list'
          ]
        }
      }
    ]
  }
  tags: {
    environment: 'dev'
  }
}
