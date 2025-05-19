resource "azurerm_management_lock" "vm_public_lock" {
  name       = "Protect-Demo-PublicVM"
  scope = azurerm_linux_virtual_machine.public_vm.id

  


  lock_level = "ReadOnly"
}

resource "azurerm_management_lock" "vm_private_lock" {
  name       = "Protect-Demo-PrivateVM"
scope = azurerm_linux_virtual_machine.private_vm.id

  lock_level = "ReadOnly"
}