resource "azurerm_eventgrid_topic" "topic" {
  name                = "eventgrid-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
}
