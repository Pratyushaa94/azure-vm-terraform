resource "azurerm_virtual_network" "vm_network" {
  name                = "Demo-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet_public" {
  name                 = "PublicSubnet"
  virtual_network_name = azurerm_virtual_network.vm_network.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet_private" {
  name                 = "PrivateSubnet"
  virtual_network_name = azurerm_virtual_network.vm_network.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = ["10.0.2.0/24"]
}