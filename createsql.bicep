resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: 'kiruthik-db-kv'
  // scope: resourceGroup('rg-contoso')   - if key vault is in a different resource group
}
module db './sqldb.bicep' = {
  name: 'sqlDbDeployment1'
  params: {
    myPassword: keyVault.getSecret('dbpassword')
    // myPassword: keyVault.getSecret('mySqlPassword', '2cc1676124b77bc9a1bfd30d8f4b6225')
  }
}
