resource "azurerm_linux_virtual_machine" "private_vm" {
  name                = "Demo-PrivateVM"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm2_private_size
  admin_username      = "azureuser"

  network_interface_ids = [azurerm_network_interface.private_nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/id_rsa.pub")
  }

  os_disk {
    caching               = "ReadWrite"
    storage_account_type  = "Standard_LRS"
  }

  

  source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts"
  version   = "latest"
}

  }
}