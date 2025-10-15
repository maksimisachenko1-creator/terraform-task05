variable "name" {
  description = "Name of the Windows App Service"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the Windows App Service"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan"
  type        = string
}

variable "allow_ip_rule_name" {
  description = "Name of the IP restriction rule for verification agent"
  type        = string
}

variable "allow_tm_rule_name" {
  description = "Name of the IP restriction rule for Traffic Manager"
  type        = string
}

variable "verification_agent_ip" {
  description = "IP address of the verification agent"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Windows App Service"
  type        = map(string)
}

variable "ip_restrictions" {
  description = "List of IP restriction rules for the Web App"
  type = list(object({
    name        = string
    ip_address  = string
    service_tag = string
    action      = string
    priority    = number
  }))
}