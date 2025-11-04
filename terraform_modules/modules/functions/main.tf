resource "azurerm_storage_account" "funcstorage" {
  name                     = "funcstorageacct"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_function_app" "paymentfunc" {
  name                       = "payment-function"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.funcplan.id
  storage_account_name       = azurerm_storage_account.funcstorage.name
  storage_account_access_key = azurerm_storage_account.funcstorage.primary_access_key
}

resource "azurerm_app_service_plan" "funcplan" {
  name                = "func-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "FunctionApp"
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}
