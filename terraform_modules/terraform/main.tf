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
}

module "apim" {
  source              = "./modules/apim"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "appgateway" {
  source              = "./modules/appgateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.networking.subnet_id
}

module "cosmosdb" {
  source              = "./modules/cosmosdb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "azuresql" {
  source              = "./modules/azuresql"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "redis" {
  source              = "./modules/redis"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "eventgrid" {
  source              = "./modules/eventgrid"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "eventhub" {
  source              = "./modules/eventhub"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "signalr" {
  source              = "./modules/signalr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "functions" {
  source              = "./modules/functions"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "containerapps" {
  source              = "./modules/containerapps"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}
