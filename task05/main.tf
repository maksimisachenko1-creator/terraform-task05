module "rg1" {
  source   = "./modules/resource_group"
  name     = "cmaz-ya42kk4d-mod5-rg-01"
  location = "East US"
  tags     = var.tags
}

module "rg2" {
  source   = "./modules/resource_group"
  name     = "cmaz-ya42kk4d-mod5-rg-02"
  location = "West US"
  tags     = var.tags
}

module "rg3" {
  source   = "./modules/resource_group"
  name     = "cmaz-ya42kk4d-mod5-rg-03"
  location = "Central US"
  tags     = var.tags
}

module "asp1" {
  source              = "./modules/app_service_plan"
  name                = "cmaz-ya42kk4d-mod5-asp-01"
  resource_group_name = module.rg1.resource_group_name
  location            = "East US"
  sku_tier            = "Standard"
  sku_size            = "S1"
  worker_count        = 2
  tags                = var.tags
}

module "asp2" {
  source              = "./modules/app_service_plan"
  name                = "cmaz-ya42kk4d-mod5-asp-02"
  resource_group_name = module.rg2.resource_group_name
  location            = "West US"
  sku_tier            = "Standard"
  sku_size            = "S1"
  worker_count        = 1
  tags                = var.tags
}

module "app1" {
  source                = "./modules/app_service"
  name                  = "cmaz-ya42kk4d-mod5-app-01"
  resource_group_name   = module.rg1.resource_group_name
  location              = "East US"
  app_service_plan_id   = module.asp1.app_service_plan_id
  verification_agent_ip = "18.153.146.156" # IP address of the verification agent
  allow_ip_rule_name    = "allow-ip"       # Name of the IP restriction rule for verification agent
  allow_tm_rule_name    = "allow-tm"       # Name of the IP restriction rule for Traffic Manager
  ip_restrictions = [
    {
      name        = "allow-ip"
      ip_address  = "18.153.146.156"
      service_tag = null
      action      = "Allow"
      priority    = 100
    },
    {
      name        = "allow-tm"
      ip_address  = null
      service_tag = "AzureTrafficManager"
      action      = "Allow"
      priority    = 200
    }
  ]
  tags = var.tags
}

module "app2" {
  source                = "./modules/app_service"
  name                  = "cmaz-ya42kk4d-mod5-app-02"
  resource_group_name   = module.rg2.resource_group_name
  location              = "West US"
  app_service_plan_id   = module.asp2.app_service_plan_id
  verification_agent_ip = "18.153.146.156" # IP address of the verification agent
  allow_ip_rule_name    = "allow-ip"       # Name of the IP restriction rule for verification agent
  allow_tm_rule_name    = "allow-tm"       # Name of the IP restriction rule for Traffic Manager
  ip_restrictions = [
    {
      name        = "allow-ip"
      ip_address  = "18.153.146.156"
      service_tag = null
      action      = "Allow"
      priority    = 100
    },
    {
      name        = "allow-tm"
      ip_address  = null
      service_tag = "AzureTrafficManager"
      action      = "Allow"
      priority    = 200
    }
  ]
  tags = var.tags
}

module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = "cmaz-ya42kk4d-mod5-traf"
  resource_group_name = module.rg3.resource_group_name
  routing_method      = "Performance"
  dns_name            = "cmaz-ya42kk4d-mod5-traf"
  app_service_ids = {
    app1 = module.app1.app_service_id
    app2 = module.app2.app_service_id
  }
  tags = var.tags
}