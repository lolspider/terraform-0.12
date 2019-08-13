
## ENV: VAULT_TOKEN 
provider "vault" {
  address         = var.vault_address
  skip_tls_verify = true
}

resource "vault_generic_secret" "vault_secrets" {
  path = format("secret/%s", var.path)

  data_json = lookup(var.secret_map, var.path)
}

