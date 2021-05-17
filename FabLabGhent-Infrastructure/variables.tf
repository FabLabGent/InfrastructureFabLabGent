variable "environment" {
    type = string
}

variable "fablabadminlogin_secret_value" {
    type = string
}

variable "SQLDB_secret_value" {
    type = string
}

variable "StorageAccountFabLab_secret_value" {
    type = string
}

variable "iothub_sku_capacity" {
    type = string
}

variable "iothub_sku_name" {
    type = string
}

variable "storage_account_account_tier" {
    type = string 
}

variable "storage_account_account_kind" {
    type = string 
} 

variable "key_vault_sku_name" {
    type = string
}

variable "sql_server_administrator_login_password" {
    type = string
}

variable "sql_server_administrator_login" {
    type = string
}