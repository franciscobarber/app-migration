resource "azurerm_api_management" "apim" {
  name                = "apim-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = "RetailApp"
  publisher_email     = "admin@retailapp.com"
  sku_name            = "Developer_1"
  tags                = var.tags
}
