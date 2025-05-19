resource "azurerm_network_security_group" "nsg_private" {
  name                = "Demo-PrivateVM-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow-SSH-from-PublicVM"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix = azurerm_network_interface.public_nic.private_ip_address

   destination_address_prefix = "*"
  }
}