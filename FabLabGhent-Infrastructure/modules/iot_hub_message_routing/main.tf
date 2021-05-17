resource "azurerm_iothub_endpoint_storage_container" "endpoint" {
    resource_group_name        = var.resource_group_name
    iothub_name                = var.iothub_name 
    connection_string          = var.primary_blob_connection_string 
    name                       = var.iothub_endpoint_name
    batch_frequency_in_seconds = var.iothub_batch_frequency_in_seconds
    max_chunk_size_in_bytes    = var.iothub_max_chunk_size_in_bytes
    container_name             = var.container_name 
    encoding                   = var.iothub_endpoint_encoding
    file_name_format           = var.iothub_endpoint_file_name_format
  }

resource "azurerm_iothub_route" "route" {
    resource_group_name = var.resource_group_name
    iothub_name         = var.iothub_name
    name                = var.iothub_route_name
    source              = var.iothub_route_source
    condition           = var.iothub_route_condition
    endpoint_names      = [azurerm_iothub_endpoint_storage_container.endpoint.name]
    enabled             = var.iothub_route_enabled
  } 