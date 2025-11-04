resource "azurerm_eventhub_namespace" "namespace" {
  name                = "eventhub-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
}

resource "azurerm_eventhub" "hub" {
  name                = "retailhub"
  namespace_name      = azurerm_eventhub_namespace.namespace.name
  resource_group_name = var.resource_group_name
  partition_count     = 2
  message_retention   = 1
}
