resource "azurerm_virtual_network" "az_vnet" {
  name                = "this-network"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = var.az_vnet_address_space
}

resource "azurerm_subnet" "public" {
  for_each             = var.public_subnets
  name                 = each.value["name"]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  address_prefixes     = each.value["address_prefixes"]
}


resource "azurerm_subnet" "private" {
  for_each             = var.private_subnets
  name                 = each.value["name"]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  address_prefixes     = each.value["address_prefixes"]
}

resource "azurerm_public_ip" "az_bastion_wan_ip" {
  name                  = var.bastion_ip_name
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  allocation_method = var.bastion_ip_alloc
  sku = "Standard"

  tags = {
    environment = var.env
  }
}


