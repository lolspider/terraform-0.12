variable "vault_address" {
  default = "https://172.17.0.1:8200"
}

variable "secret_map" {
  type    = "map"
  default = {}
}

variable "path" {
  description = "Path of vault secrets"
  default     = ""
}
