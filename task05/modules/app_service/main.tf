resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = var.app_service_plan_id
  tags                = var.tags

  site_config {
    ip_restriction = [
      {
        name                          = var.allow_ip_rule_name
        ip_address                    = var.verification_agent_ip
        action                        = "Allow"
        priority                      = 100
      },
      {
        name                          = var.allow_tm_rule_name
        service_tag                   = "AzureTrafficManager"
        action                        = "Allow"
        priority                      = 200
      }
    ]
    default_action = "Deny"
  }
}