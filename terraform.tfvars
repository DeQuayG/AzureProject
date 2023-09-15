### General Values
env                     = "dev"
resource_group_name     = "az-project-rg"
resource_group_location = "East US 2"

## Backend Config Variables
storage_account_name    = "this061storage701account"
blob_name               = "this000870810blob"
container_name          = "this07870803container"
blob_type               = "Block"




### Network Values ####
bastion_ip_alloc = "Static"
bastion_ip_name = "bastion-wan-ip-addr"
az_vnet_address_space = ["10.10.0.0/16"]