resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: 'gokula-db-kv'
  // scope: resourceGroup('rg-contoso')   - if key vault is in a different resource group
}
module db './sqldb.bicep' = {
  name: 'sqlDbDeployment1'
  params: {
    myPassword: keyVault.getSecret('dbpassword')
  }
}
