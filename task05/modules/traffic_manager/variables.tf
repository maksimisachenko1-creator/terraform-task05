variable "name" {
  description = "Name of the Traffic Manager profile"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the Traffic Manager profile"
  type        = string
}

variable "routing_method" {
  description = "Routing method for the Traffic Manager profile"
  type        = string
}

variable "dns_name" {
  description = "DNS name for the Traffic Manager profile"
  type        = string
}

variable "app_service_ids" {
  description = "List of App Service IDs to use as Traffic Manager endpoints"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the Traffic Manager profile"
  type        = map(string)
}