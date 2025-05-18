resource "azurerm_virtual_machine" "vm_public" {
  name                  = "Demo-PublicVM"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = var.vm1_public_size
  network_interface_ids = [azurerm_network_interface.nic_public.id]

  os_profile {
    computer_name  = "vm-public"
    admin_username = "adminuser"
    admin_password = "SecurePass123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "vm-public-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}