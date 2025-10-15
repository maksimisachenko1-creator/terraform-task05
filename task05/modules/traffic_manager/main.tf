resource "azurerm_traffic_manager_profile" "tm" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
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

resource "azurerm_traffic_manager_endpoint" "tm_endpoints" {
  count               = length(var.app_service_ids)
  name                = "endpoint-${count.index}"
  profile_id          = azurerm_traffic_manager_profile.tm.id
  type                = "AzureEndpoints"
  target_resource_id  = var.app_service_ids[count.index]
}