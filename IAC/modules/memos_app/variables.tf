variable "env" {
  description = "Environment name"
  type = string
}

variable "product" {
  description = "Product name"
  type = string
}

variable "location" {
  description = "Resource location"
  default = "West US 2"
}

variable "app_tier" {
  description = "Application tier"
  default = "Basic"
}

variable "app_size" {
  description = "Application size"
  default = "B1"
}

variable "sqlsvr_admin_name" {
  description = "SQL server admin user name"
  default = "dbadmin"
}

variable "sqlsvr_admin_password" {
  description = "SQL server admin user name"
  type = string
}

variable "sqldb_edition" {
  description = "SQL database edition"
  default = "Basic"
}

variable "sqldb_service_objective" {
  description = "SQL database service objection"
  default = "Basic"
}