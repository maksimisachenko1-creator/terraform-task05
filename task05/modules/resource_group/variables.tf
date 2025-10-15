variable "name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the Resource Group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Resource Group"
  type        = map(string)
}