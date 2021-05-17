variable "blob_name" {
    type = string
}

variable "blob_type" {
    type = string
    description = "(Required) The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created. Azure Storage supports three types of blobs: 1) Block blobs store text and binary data. Block blobs are made up of blocks of data that can be managed individually. Block blobs can store up to about 190.7 TiB. 2) Append blobs are made up of blocks like block blobs, but are optimized for append operations. Append blobs are ideal for scenarios such as logging data from virtual machines. 3) Page blobs store random access files up to 8 TiB in size. Page blobs store virtual hard drive (VHD) files and serve as disks for Azure virtual machines. For more information about page blobs, see Overview of Azure page blobs For more information about the different types of blobs, see Understanding Block Blobs, Append Blobs, and Page Blobs."
}

variable "blob_access_tier" {
    type = string
    description = "(Optional) The access tier of the storage blob. Possible values are Archive, Cool and Hot."
}

variable "storage_account_name" {
    type = string
    description = "Reference by: module.storage_account.storage-account-name"
}

variable "storage_container_name" {
    type = string
    description = "Referece by: module.storage_container.storage-container-name"
} 