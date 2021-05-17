variable "key_vault_name" {
    type = string
}

variable "key_vault_enabled_for_disk_encryption" {
    type = string
    description = "(Optional) Boolean (true/false) flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}

variable "key_vault_soft_delete_retention_days" {
    type = string
    description = "(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
}

variable "key_vault_purge_protection_enabled" {
    type = string
    description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false. Once Purge Protection has been Enabled it's not possible to Disable it. Support for disabling purge protection is being tracked in this Azure API issue. Deleting the Key Vault with Purge Protection Enabled will schedule the Key Vault to be deleted (which will happen by Azure in the configured number of days, currently 90 days - which will be configurable in Terraform in the future)."
}

variable "key_vault_sku_name" {
    type = string
    description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "resource_group_location" {
    type = string
}

variable "resource_group_name" {
    type = string
}