resource "azurerm_storage_account" "this" {
  name                     = replace("${local.resource_name}sa","-","")
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

resource "azurerm_spring_cloud_storage" "this" {
  name                    = "${local.resource_name}sa"
  spring_cloud_service_id = azurerm_spring_cloud_service.this.id
  storage_account_name    = azurerm_storage_account.this.name
  storage_account_key     = azurerm_storage_account.this.primary_access_key
}
