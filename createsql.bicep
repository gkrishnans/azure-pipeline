resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: 'gokula-db-key'
}
module db './sqldb.bicep' = {
  name: 'sqlDbDeployment1'
  params: {
    myPassword: keyVault.getSecret('dbpassword')
  }
}
