resource "azurerm_network_security_group" "subnet_nsg" {
  name                = "ThisSecurityGroup1"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule = []

  tags = {
    environment = var.env
  }

}



resource "azurerm_network_security_rule" "public_subnet_rule" {
    name                       = "thisnsg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    network_security_group_name = azurerm_network_security_group.subnet_nsg.name
    resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "pub_sub_nsg" {
  subnet_id                 = var.public_subnet_ids["public_subnet_1"]
  network_security_group_id = azurerm_network_security_group.subnet_nsg.id
}




