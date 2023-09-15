output "bastion_ip_id" {
  value = azurerm_public_ip.az_bastion_wan_ip.id
}

output "azure_public_subnet_ids" {
  value = {
    for id in keys(var.public_subnets) : id => azurerm_subnet.public[id].id
  }
}

output "azure_private_subnet_ids" {
  value = {
    for id in keys(var.private_subnets) : id => azurerm_subnet.private[id].id
  }
}

