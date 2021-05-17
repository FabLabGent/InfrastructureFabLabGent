variable "storage_account_name" {
    type = string
}

variable "storage_account_account_tier" {
    type = string
    description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "storage_account_account_replication_type" {
    type = string
    description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
}

variable "storage_account_account_kind" {
    type = string
    description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Standard: StorageV2, Premium: BlobStorage, BlockBlobStorage, FileStorage. Changing this forces a new resource to be created. Defaults to StorageV2."
}

variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}