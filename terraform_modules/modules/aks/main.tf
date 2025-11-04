resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-retail"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "retailaks"

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }

  role_based_access_control {
    enabled = true
  }

  tags = var.tags
}
