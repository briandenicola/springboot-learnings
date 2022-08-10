data "azurerm_virtual_network" "vnet" {
  name                = "DevSub01-VNet-001"
  resource_group_name = "DevSub01_Network_RG"
}

data "azurerm_subnet" "services_subnet" {
  name                 = "springcloud-runtime"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

data "azurerm_subnet" "app_subnet" {
  name                 = "springcloud-apps"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}