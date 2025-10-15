variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the App Service Plan"
  type        = string
}

variable "sku_tier" {
  description = "SKU tier for the App Service Plan"
  type        = string
}

variable "sku_size" {
  description = "SKU size for the App Service Plan"
  type        = string
}

variable "worker_count" {
  description = "Number of workers for the App Service Plan"
  type        = number
}

variable "tags" {
  description = "Tags to apply to the App Service Plan"
  type        = map(string)
}