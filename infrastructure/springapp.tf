
resource "azurerm_application_insights" "this" {
    name                = "${local.resource_name}-ai"
    location            = azurerm_resource_group.this.location
    resource_group_name = azurerm_resource_group.this.name
    application_type    = "web"
}

resource "azurerm_spring_cloud_service" "this" {
    depends_on = [
      azurerm_role_assignment.owner
    ]
    
    name                = "${local.resource_name}-springservice"
    resource_group_name = azurerm_resource_group.this.name
    location            = azurerm_resource_group.this.location
    sku_name            = "S0"

    config_server_git_setting {
        uri          = "https://github.com/Azure-Samples/piggymetrics"
        label        = "config"
        search_paths = ["dir1", "dir2"]
    }

    network {
        app_subnet_id                           = data.azurerm_subnet.app_subnet.id
        service_runtime_subnet_id               = data.azurerm_subnet.services_subnet.id
        cidr_ranges                             = ["10.20.0.0/16", "10.21.0.0/16", "10.30.0.1/16"]
        app_network_resource_group              = "${local.resource_name}_apps_rg"
        service_runtime_network_resource_group  = "${local.resource_name}_service_runtime_rg"
    }

    trace {
        connection_string = azurerm_application_insights.this.connection_string
        sample_rate       = 10.0
    }

}

resource "azurerm_spring_cloud_app" "this" {
    name                = "${local.resource_name}-app"
    resource_group_name = azurerm_resource_group.this.name
    service_name        = azurerm_spring_cloud_service.this.name

    identity {
        type = "SystemAssigned"
    }
}