output "adf_sql_dataset" {
    value = azurerm_data_factory_dataset_sql_server_table.adf_ds_sql.name
}