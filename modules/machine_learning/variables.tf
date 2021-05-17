variable "application_insights_name" {
    type = string
}

variable "application_insights_application_type" {
    type = string
    description = "(Required) (normally web) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created."
}

variable "machine_learning_workspace_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "key_vault_id" {
    type = string
}

variable "storage_account_id" {
    type = string
}
