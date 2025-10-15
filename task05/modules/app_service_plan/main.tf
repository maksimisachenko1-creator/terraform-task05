resource "azurerm_service_plan" "asp" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_size
  os_type             = "Windows"
  tags                = var.tags
}