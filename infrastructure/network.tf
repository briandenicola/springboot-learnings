resource "azurerm_virtual_network" "this" {
  name                = "${local.resource_name}-network"
  address_space       = [ local.vnet_cidr ]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "springcloud-runtime"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [ local.runtime_subnet_cidir ]
}

resource "azurerm_subnet" "services_subnet" {
  name                 = "springcloud-apps"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [ local.apps_subnet_cidir ]
}

resource "azurerm_role_assignment" "owner" {
  scope                     = azurerm_virtual_network.this.id
  role_definition_name      = "Owner"
  principal_id              = "77e44c53-4911-427e-83c2-e2a52f569dee"
  skip_service_principal_aad_check = true
}