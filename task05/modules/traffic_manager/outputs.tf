output "traffic_manager_fqdn" {
  description = "FQDN of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.tm.fqdn
}