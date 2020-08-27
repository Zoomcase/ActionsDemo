variable "product" {
  description = "Product name"
  default     = "Memos"
}

variable "sqlsvr_admin_password" {
  description = "SQL server admin user name"
  type        = string
}