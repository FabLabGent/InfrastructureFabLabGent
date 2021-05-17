variable "iothub_name" {
    type = string
}

variable "iothub_sku_name" {
    type = string
    description = "(Required) The name of the sku. Possible values are Basic tier (B1, B2, B3), free (F1) and Standard tier (S1, S2, and S3)."
}

variable "iothub_sku_capacity" {
    type = string
    description = "(Required) The number of provisioned IoT Hub units."
}

variable "resource_group_name" {
    type = string
    description = "Reference by: module.resource_group.rg_name" 
}

variable "resource_group_location" {
    type = string
    description = "Reference by: module.resource_group.rg_location"
} 