### General Variables #####

variable "env" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}


### Storage Variables ####

variable "container_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "blob_name" {
  type = string
}


variable "blob_type" {
  type = string
}

######## Network Variables ####


variable "bastion_ip_alloc" {
  type = string
}

variable "bastion_ip_name" {
  type = string
}

variable "az_vnet_address_space" {
  type = list(any)
}