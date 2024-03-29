
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
    
    name                = "${local.resource_name}-springapps"
    resource_group_name = azurerm_resource_group.this.name
    location            = azurerm_resource_group.this.location
    sku_name            = "S0"

    config_server_git_setting {
        uri          = "https://github.com/Azure-Samples/spring-petclinic-microservices-config.git"
    }

    trace {
        connection_string = azurerm_application_insights.this.connection_string
        sample_rate       = 10.0
    }

}

# resource "azurerm_spring_cloud_app" "this" {
#     name                = "${local.resource_name}-app"
#     resource_group_name = azurerm_resource_group.this.name
#     service_name        = azurerm_spring_cloud_service.this.name

#     identity {
#         type = "SystemAssigned"
#     }
# }