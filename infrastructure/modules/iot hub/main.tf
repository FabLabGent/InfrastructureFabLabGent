resource "azurerm_iothub" "ioth" {
  name                = var.iothub_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = var.iothub_sku_name
    capacity = var.iothub_sku_capacity
  }

  endpoint {
    type                       = var.iothub_endpoint_type
    connection_string          = azurerm_storage_account.sa.primary_blob_connection_string
    name                       = var.iothub_endpoint_name
    batch_frequency_in_seconds = var.iothub_batch_frequency_in_seconds
    max_chunk_size_in_bytes    = var.iothub_max_chunk_size_in_bytes
    container_name             = azurerm_storage_container.sc.name
    encoding                   = var.iothub_endpoint_encoding
    file_name_format           = var.iothub_endpoint_file_name_format
  }

  route {
    name           = var.iothub_route1_name
    source         = var.iothub_route1_source
    condition      = var.iothub_route1_condition
    endpoint_names = [var.iothub_route1_name]
    enabled        = var.iothub_route1_enabled
  }

  route {
    name           = var.iothub_route2_name
    source         = var.iothub_route2_source
    condition      = var.iothub_route2_condition
    endpoint_names = [var.iothub_route2_name]
    enabled        = var.iothub_route2_enabled
  }

  route {
    name           = var.iothub_route3_name
    source         = var.iothub_route3_source
    condition      = var.iothub_route3_condition
    endpoint_names = [var.iothub_route3_name]
    enabled        = var.iothub_route3_enabled
  }

  route {
    name           = var.iothub_route4_name
    source         = var.iothub_route4_source
    condition      = var.iothub_route4_condition
    endpoint_names = [var.iothub_route4_name]
    enabled        = var.iothub_route4_enabled
  }

tags = {
    purpose = var.iothub_tags
  }
}