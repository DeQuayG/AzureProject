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