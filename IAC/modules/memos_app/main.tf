resource "azurerm_resource_group" "this" {
  name     = local.base_name
  location = var.location

  tags = {
    environment = var.env
  }
}

resource "azurerm_app_service_plan" "this" {
  name                = "${lower(local.base_name)}-asp"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  sku {
    tier = var.app_tier
    size = var.app_size
  }

  tags = {
    environment = var.env
  }
}

resource "azurerm_app_service" "this" {
  name                = lower(local.base_name)
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.this.id

  tags = {
    environment = var.env
  }

  app_settings = {
    "ConnectionStrings__MainDatabase" = "Server=tcp:devmemos-sqlsvr.database.windows.net,1433;Initial Catalog=${lower(var.product)};Persist Security Info=False;User ID=${var.sqlsvr_admin_name};Password=${var.sqlsvr_admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    "AppSettings__Environment" = "${var.env}"
  }
}

resource "azurerm_sql_server" "this" {
  name                         = "${lower(local.base_name)}-sqlsvr"
  location                     = azurerm_resource_group.this.location
  resource_group_name          = azurerm_resource_group.this.name
  version                      = "12.0"
  administrator_login          = var.sqlsvr_admin_name
  administrator_login_password = var.sqlsvr_admin_password

  tags = {
    environment = var.env
  }
}

resource "azurerm_sql_database" "this" {
  name                             = lower(var.product)
  location                         = azurerm_resource_group.this.location
  resource_group_name              = azurerm_resource_group.this.name
  server_name                      = azurerm_sql_server.this.name
  edition                          = var.sqldb_edition
  requested_service_objective_name = var.sqldb_service_objective
  tags = {
    environment = "production"
  }
}

resource "azurerm_sql_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  resource_group_name = azurerm_resource_group.this.name
  server_name         = azurerm_sql_server.this.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}