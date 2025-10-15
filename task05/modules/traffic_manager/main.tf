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

  dynamic "endpoint" {
    for_each = var.app_service_ids
    content {
      name                = "endpoint-${endpoint.key}"
      target_resource_id  = endpoint.value
      type                = "AzureEndpoints"
    }
  }
}