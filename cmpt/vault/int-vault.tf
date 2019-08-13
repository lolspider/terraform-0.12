terraform {
  backend "azurerm" {
    environment          = "china"
    resource_group_name  = "rg101"
    storage_account_name = "blob101"
    container_name       = "terraform-state"
    key                  = "vault/terraform.tfstate"
  }
}

module "int_vault_secrets_under_path_docker" {
  source = "../../../modules/vault"

  path       = "docker"
  secret_map = var.int_secret_map
  // vault_address = var.int_vault_address

}


module "int_vault_secrets_under_path_grafana" {
  source = "../../../modules/vault"

  path       = "grafana"
  secret_map = var.int_secret_map
  // vault_address = var.int_vault_address

}


module "int_vault_secrets_under_path_kibana" {
  source = "../../../modules/vault"

  path       = "kibana"
  secret_map = var.int_secret_map
  // vault_address = var.int_vault_address

}