module "dev" {
  source = "../modules/memos_app"
  
  env                   = "Dev"
  product               = var.product
  sqlsvr_admin_password = var.sqlsvr_admin_password
}

# module "stage" {
#   source = "../modules/memos_app"
  
#   env                   = "Stage"
#   product               = var.product
#   sqlsvr_admin_password = var.sqlsvr_admin_password
# }

# module "prod" {
#   source = "../modules/memos_app"
  
#   env                   = "Prod"
#   product               = var.product
#   sqlsvr_admin_password = var.sqlsvr_admin_password
# }