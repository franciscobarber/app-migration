resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.networking.subnet_id
  acr_name            = module.acr.name
  tags     = var.tags
}

module "apim" {
  source              = "./modules/apim"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags     = var.tags
}

module "appgateway" {
  source              = "./modules/appgateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.networking.subnet_id
  tags     = var.tags
}
