resource "azurerm_redis_cache" "this" {
  name                  = "${local.resource_name}-cache"
  resource_group_name   = azurerm_resource_group.this.name
  location              = azurerm_resource_group.this.location
  capacity              = 1
  family                = "P"
  sku_name              = "Premium"
  enable_non_ssl_port   = false
  minimum_tls_version   = "1.2"

  redis_configuration {
  }
}

resource "azurerm_spring_cloud_app_redis_association" "this" {
  name                = "${local.resource_name}-redis-bind"
  spring_cloud_app_id = azurerm_spring_cloud_app.this.id
  redis_cache_id      = azurerm_redis_cache.this.id
  redis_access_key    = azurerm_redis_cache.this.primary_access_key
  ssl_enabled         = true
}