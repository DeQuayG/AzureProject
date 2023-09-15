# resource "azurerm_linux_virtual_machine_scale_set" "example" {
#   name                = "example-vmss"
#   resource_group_name = var.resource_group_name
#   location            = var.resource_group_location
#   sku                 = "Standard_F2"
#   instances           = 1
#   admin_username      = "adminuser"

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = local.first_public_key
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-focal"
#     sku       = "20_04-lts"
#     version   = "latest"
#   }

#   os_disk {
#     storage_account_type = "Standard_LRS"
#     caching              = "ReadWrite"
#   }

#   network_interface {
#     name    = "example"
#     primary = true

#     ip_configuration {
#       name      = "internal"
#       primary   = true
#       subnet_id = azurerm_subnet.internal.id
#     }
#   }
# }

resource "azurerm_bastion_host" "this_bastion" {
  name                = "thisbastion"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "AzureBastionSubnet"
    subnet_id            = var.bastion_subnet
    public_ip_address_id = var.bastion_ip_id
  }
}