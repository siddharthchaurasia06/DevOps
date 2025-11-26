locals {
  common_tags = {
    "ManagedBy"   = "Terraform"
    "Owner"       = "TodoAppTeam"
    "Environment" = "dev"
  }
}


module "rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "rg-dev-todoapp-01"
  rg_location = "northeurope"
  rg_tags     = local.common_tags
}


module "acr" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_container_registry"
  acr_name   = "acrtodoappsiddharth1"
  rg_name    = "rg-dev-todoapp-01"
  location   = "northeurope"
  tags       = local.common_tags
}

module "sql_server" {
  depends_on      = [module.rg]
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "siddharthsql-dev"
  rg_name         = "rg-dev-todoapp-01"
  location        = "northeurope"
  admin_username  = "devopsadmin"
  admin_password  = "P@ssw01rd@123"
  tags            = local.common_tags
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "siddharthdb-dev"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = local.common_tags
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks_name   = "aks-dev-todoapp"
  location   = "northeurope"
  rg_name    = "rg-dev-todoapp-01"
  dns_prefix = "aks-dev-todoapp"
  tags       = local.common_tags
}


module "pip" {
  source   = "../../modules/azurerm_public_ip"
  pip_name = "pip-dev"
  rg_name  = "rg-dev-todoapp-01"
  location = "northeurope"
  sku      = "Standard"
  tags     = local.common_tags
}