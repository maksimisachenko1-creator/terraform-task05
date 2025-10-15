variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Public IP"
  type        = string
}

variable "dns_name_label" {
  description = "DNS name label for the Public IP"
  type        = string
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
  default     = "azureuser"
}

variable "vm_password" {
  description = "Admin password for the Virtual Machine"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "allow_http_rule_name" {
  description = "Name of the NSG rule to allow HTTP traffic"
  type        = string
}

variable "allow_ssh_rule_name" {
  description = "Name of the NSG rule to allow SSH traffic"
  type        = string
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration for the network interface"
  type        = string
  default     = "internal"
}