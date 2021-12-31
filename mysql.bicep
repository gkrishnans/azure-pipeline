resource mySQLServer 'Microsoft.DBforMySQL/servers@2017-12-01' = {
  name: 'gokula-mysql-server'
  location: 'useast'
  sku: {
    name:'Standard_LRS'
    tier: 'Basic'
  }
  properties: {
    createMode: 'Default'
    version: '5.7'
    administratorLogin: 'root'
    administratorLoginPassword: 'rootroot'
    sslEnforcement: 'Enabled' // You should explicitly enforce encription for MySQL 5.7
    minimalTlsVersion: 'TLS1_2' // Minimal TLS version to accept for server connections
  }
}


resource firewallRules 'Microsoft.DBforMySQL/servers/firewallRules@2017-12-01' = {
  parent: mySQLServer
  name: 'AllowAzureIPs'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
