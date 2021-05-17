variable "iothub_shared_access_policy_name" {
    type = string
}

variable "registry_read" {
    type = string
    description = "(Optional) Adds RegistryRead permission to this Shared Access Account. It allows read access to the identity registry."
}

variable "registry_write" {
    type = string
    description = "(Optional) Adds RegistryWrite permission to this Shared Access Account. It allows write access to the identity registry."
}

variable "device_connect" {
    type = string
    description = "(Optional) Adds DeviceConnect permission to this Shared Access Account. It allows sending and receiving on the device-side endpoints."
}

variable "service_connect" {
    type = string
    description = "(Optional) Adds ServiceConnect permission to this Shared Access Account. It allows sending and receiving on the cloud-side endpoints."
}

variable "resource_group_name" {
    type = string
}

variable "iothub_name" {
    type = string
}