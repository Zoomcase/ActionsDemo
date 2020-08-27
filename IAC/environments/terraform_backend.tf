terraform {
  backend "azurerm" {
    resource_group_name  = "Common"
    storage_account_name = "498c4f8ea0fe"
    container_name       = "tfstate"
    key                  = "actionsdemo.terraform.tfstate"
  }
}