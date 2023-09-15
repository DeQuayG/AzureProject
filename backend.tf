terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.72.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  storage_use_azuread = true
  features {

  }
}

resource "azurerm_resource_group" "this_resource_group" {
  name     = "az-project-rg"
  location = var.resource_group_location

  tags = {
      environment = var.env
  }
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "az-project-rg"
#     storage_account_name = "this0storage0account"
#     container_name       = "this-container"
#     key                  = "dev-backend-tfstate"
#   }
# }



