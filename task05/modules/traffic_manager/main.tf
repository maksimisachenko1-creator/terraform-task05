resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method
  dns_config {
    relative_name = var.dns_name
    ttl           = 60
  }
  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }
  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "app1" {
  name = "endpoint-app1"
  # Link this endpoint to the Traffic Manager Profile created above
  profile_id = azurerm_traffic_manager_profile.tm.id
  # Target is the ID of the Azure resource (e.g., App Service, VM, etc.)
  target_resource_id = var.app_service_ids["app1"]

  # Optional: Configure weight if using Weighted routing
  # weight             = 1 
}

resource "azurerm_traffic_manager_azure_endpoint" "app2" {
  name = "endpoint-app2"
  # Link this endpoint to the Traffic Manager Profile created above
  profile_id = azurerm_traffic_manager_profile.tm.id
  # Target is the ID of the Azure resource (e.g., App Service, VM, etc.)
  target_resource_id = var.app_service_ids["app2"]

  # Optional: Configure weight if using Weighted routing
  # weight             = 1 
}