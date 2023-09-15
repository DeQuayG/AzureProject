variable "private_subnets" {
  type = map(any)
  default = {
    private_subnet_1 = {
      name = "private_subnet_1"
      address_prefixes = ["10.10.1.0/24"]
    }
    private_subnet_2 = {
      name = "private_subnet_2"
      address_prefixes = ["10.10.2.0/24"]
    }
    private_subnet_3 = {
      name = "private_subnet_3"
      address_prefixes = ["10.10.3.0/24"]
    }
  }
}

variable "public_subnets" {
    type = map(any)
  default = {
    public_subnet_1 = {
      name = "public_subnet_1"
      address_prefixes = ["10.10.4.0/24"]
    }
    public_subnet_2 = {
      name = "public_subnet_2"
      address_prefixes = ["10.10.5.0/24"]
    }
    bastion_subnet = {
      name = "AzureBastionSubnet"
      address_prefixes = ["10.10.6.0/24"]
    }
  }
}

variable "bastion_ip_alloc" {
  type = string
}

variable "bastion_ip_name" {
  type = string
}

variable "az_vnet_address_space" {
  type = list(any)
}

variable "env" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "resource_group_name" {
  type = string
}