resource "azurerm_sql_server" "sql" {
  name                         = "sql-retail"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssword1234!"
}

resource "azurerm_sql_database" "sqldb" {
  name                = "retaildb"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql.name
  sku_name            = "Basic"
}
