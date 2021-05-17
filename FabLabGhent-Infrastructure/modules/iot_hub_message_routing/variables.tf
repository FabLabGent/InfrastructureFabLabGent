variable "iothub_endpoint_name" {
    type = string
}

variable "iothub_batch_frequency_in_seconds" {
    type = string
    description = " (Optional) Time interval at which blobs are written to storage. Value should be between 60 and 720 seconds. Default value is 300 seconds."
}

variable "iothub_max_chunk_size_in_bytes" {
    type = string
}

variable "iothub_endpoint_encoding" {
    type = string
    description = "(Optional) Encoding that is used to serialize messages to blobs. Supported values are 'avro' and 'json'. Default value is 'avro'."
}

variable "iothub_endpoint_file_name_format" {
    type = string
    description = "(Optional) File name format for the blob. Default format is {iothub}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}. All parameters are mandatory but can be reordered."
}

variable "iothub_route_name" {
    type = string
}

variable "iothub_route_source" {
    type = string
    description = "(Required) The source that the routing rule is to be applied to. Possible values include: DeviceJobLifecycleEvents, DeviceLifecycleEvents, DeviceMessages, Invalid, TwinChangeEvents."
}

variable "iothub_route_condition" {
    type = string
    description = "(Optional) Routing Query. The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default. For grammar, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-query-language"
}

variable "iothub_route_enabled" {
    type = string
    description = "(Required) Specifies whether a route is enabled. Boolean: true or false"
}

variable "resource_group_name" {
    type = string
    description = "Reference by: module.resource_group.rg_name"
}

variable "iothub_name" {
    type = string
    description = "Reference by: module.iot_hub.iot-hub-name"
}

variable "container_name" {
    type = string
    description = "Reference by: module.storage_account.storage-container-name"
} 

variable "primary_blob_connection_string" {
    type = string
} 