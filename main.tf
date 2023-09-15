resource "random_integer" "number_suffix" {
  min = 100
  max = 999
}

resource "random_string" "words" {
  length           = 24
  numeric          = true
  special          = false
  lower            = true

}

module "storage" {
  source = "./modules/storage"

  env = var.env  
  blob_name = var.blob_name
  container_name = var.container_name
  resource_group_name = var.resource_group_name
  storage_account_name = var.storage_account_name
  resource_group_location = var.resource_group_location
  blob_type = var.blob_type
  resource_group_id     = azurerm_resource_group.this_resource_group.id
}

module "network" {
  source = "./modules/network"

  env = var.env
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  bastion_ip_alloc = var.bastion_ip_alloc
  bastion_ip_name = var.bastion_ip_name
  az_vnet_address_space = var.az_vnet_address_space
}

module "compute" {
  source = "./modules/compute"

  resource_group_location = var.resource_group_location
  resource_group_name = var.resource_group_name
  bastion_ip_id = module.network.bastion_ip_id
  bastion_subnet = module.network.azure_public_subnet_ids["bastion_subnet"]
}

module "security" {
  source = "./modules/security"

  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  env = var.env
  public_subnet_ids = module.network.azure_public_subnet_ids
}