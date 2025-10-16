resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.app_service_plan_id
  tags                = var.tags

  site_config {
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name = ip_restriction.value.name
        ip_address = ip_restriction.value.ip_address != null ? (
          length(regexall("/", ip_restriction.value.ip_address)) > 0 ? ip_restriction.value.ip_address : "${ip_restriction.value.ip_address}/32"
        ) : null
        service_tag = ip_restriction.value.service_tag
        action      = ip_restriction.value.action
        priority    = ip_restriction.value.priority
      }
    }
  }
}