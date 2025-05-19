resource "azurerm_linux_virtual_machine" "public_vm" {
  name                = "Demo-PublicVM"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm1_public_size
  admin_username      = "azureuser"

  network_interface_ids = [azurerm_network_interface.public_nic.id]

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
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
