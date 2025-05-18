terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = "demoterraformstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}