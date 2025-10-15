output "app_service_id" {
  description = "ID of the Windows App Service"
  value       = azurerm_windows_web_app.app.id
}