variable "key_vault_secret_name" {
    type = string
}

variable "key_vault_secret_value" {
    type = string
    sensitive = true
}

variable "key_vault_id" {
    type = string
}