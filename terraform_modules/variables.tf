variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "rg-retail-app"
}

variable "tags" {
  default = {
    environment = "dev"
    project     = "retail-migration"
  }
}
