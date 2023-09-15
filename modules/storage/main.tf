resource "azurerm_storage_account" "this_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.env
  }

  depends_on = [var.resource_group_id]
}

resource "azurerm_storage_container" "this_storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.this_storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.this_storage_account.name
  storage_container_name = azurerm_storage_container.this_storage_container.name
  type                   = var.blob_type
}