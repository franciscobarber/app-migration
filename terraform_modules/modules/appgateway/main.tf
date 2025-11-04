resource "azurerm_public_ip" "appgw" {
  name                = "appgw-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  name                = "appgw-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 1
  }
  gateway_ip_configuration {
    name      = "appgw-ipconfig"
    subnet_id = var.subnet_id
  }
  frontend_port {
    name = "frontendPort"
    port = 80
  }
  frontend_ip_configuration {
    name                 = "frontendIP"
    public_ip_address_id = azurerm_public_ip.appgw.id
  }
  tags = var.tags
}
