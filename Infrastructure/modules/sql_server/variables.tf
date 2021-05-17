variable "sql_server_name" {
    type = string
}

variable "sql_server_administrator_login" {
    type = string
}

variable "sql_server_administrator_login_password" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "storage_endpoint" {
    type = string
    description = "primary_blob_endpoint"
} 

variable "storage_account_access_key" {
    type = string
    description = "primary_access_key"
}