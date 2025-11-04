resource "azurerm_container_app_environment" "env" {
  name                = "container-env"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app" "recommendation" {
  name                         = "recommendation-service"
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"
  template {
    container {
      name   = "recommendation"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }
}
