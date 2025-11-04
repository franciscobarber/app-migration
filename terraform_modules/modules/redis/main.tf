resource "azurerm_redis_cache" "redis" {
  name                = "redis-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
}
