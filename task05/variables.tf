variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "verification_agent_ip" {
  description = "IP address of the verification agent"
  type        = string
}

variable "allow_ip_rule_name" {
  description = "Name for allow-ip rule"
  type        = string
}

variable "allow_tm_rule_name" {
  description = "Name for allow-tm rule"
  type        = string
}

variable "app1_name" {
  description = "App1 name"
  type        = string
}

variable "app2_name" {
  description = "App2 name"
  type        = string
}

variable "asp1_name" {
  description = "App Service Plan 1 name"
  type        = string
}

variable "asp1_worker_count" {
  description = "Worker count for asp1"
  type        = number
}

variable "asp1_sku" {
  description = "SKU for asp1"
  type        = string
}

variable "asp2_name" {
  description = "App Service Plan 2 name"
  type        = string
}

variable "asp2_worker_count" {
  description = "Worker count for asp2"
  type        = number
}

variable "asp2_sku" {
  description = "SKU for asp2"
  type        = string
}

variable "rg1_name" {
  description = "Resource Group 1 name"
  type        = string
}

variable "rg2_name" {
  description = "Resource Group 2 name"
  type        = string
}

variable "rg3_name" {
  description = "Resource Group 3 name"
  type        = string
}

variable "traffic_manager_name" {
  description = "Traffic Manager profile name"
  type        = string
}

variable "traffic_manager_method" {
  description = "Traffic Manager routing method"
  type        = string
}