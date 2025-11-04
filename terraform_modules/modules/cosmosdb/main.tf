resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "cosmos-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "catalog" {
  name                = "catalogdb"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}

resource "azurerm_cosmosdb_table" "cart" {
  name                = "carttable"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}

resource "azurerm_cosmosdb_mongo_database" "inventory" {
  name                = "inventorydb"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}
