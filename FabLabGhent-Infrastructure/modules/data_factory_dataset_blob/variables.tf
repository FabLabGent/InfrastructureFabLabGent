variable "data_factory_dataset_azure_blob_name" {
    type = string
}

variable "adf_ds_blob_path" {
    type = string
    description = "(Required) The path of the Azure Blob."
}

variable "adf_ds_blob_filename" {
    type = string
    description = "(Required) The filename of the Azure Blob."
}

variable "resource_group_name" {
    type = string
}

variable "data_factory_name" {
    type = string
}

variable "linked_service_name" {
    type = string
}  