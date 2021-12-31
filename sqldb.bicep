@secure()
param myPassword string
resource sqlserver 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: 'gokulasql'
  location: 'eastus'
  properties: {
    administratorLogin: 'gokula'
    administratorLoginPassword: myPassword
  }
  resource sqldb 'databases' = {
    name: 'inventorydb'
    location: 'eastus'
  }
  tags: {
    Owner : 'gokula-krishnan'
  }
}
