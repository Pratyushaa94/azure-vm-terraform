resource "azurerm_management_lock" "vm_public_lock" {
  name       = "Protect-Demo-PublicVM"
  scope      = azurerm_virtual_machine.vm_public.id
  lock_level = "ReadOnly"
}

resource "azurerm_management_lock" "vm_private_lock" {
  name       = "Protect-Demo-PrivateVM"
  scope      = azurerm_virtual_machine.vm_private.id
  lock_level = "ReadOnly"
}