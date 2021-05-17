terraform {
  backend "azurerm" {
    resource_group_name   = module.resource_group.rg_name
    storage_account_name  = module.storage_account.storage_account_name
    container_name        = module.fablab_container.storage_container_name
    key                   = module.storage_account.storage_account_primary_access_key
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}  

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
  }
}
  skip_provider_registration = true
}


#### RESOURCE GROUP ####



module "resource_group" {
    source              = "./modules/resource_group"
    resource_group_name = "fablabrg${var.environment}"
}



#### IOT HUB ####



module "iot_hub" {
    source                  = "./modules/iot_hub"
    iothub_name             = "fablabiothub-${var.environment}"
    iothub_sku_name         = var.iothub_sku_name 
    iothub_sku_capacity     = var.iothub_sku_capacity
    resource_group_name     = module.resource_group.rg_name 
    resource_group_location = module.resource_group.rg_location  
}



#### IOT HUB MESSAGE ROUTING ####



module "motion_message_routing" {
    source                              = "./modules/iot_hub_message_routing"
    iothub_endpoint_name                = "Motion_endpoint_${var.environment}"
    iothub_batch_frequency_in_seconds   = 300
    iothub_max_chunk_size_in_bytes      = 314572800
    iothub_endpoint_encoding            = "json"
    iothub_endpoint_file_name_format    = "{iothub}/{sensor}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}"
    iothub_route_name                   = "Motion_route_${var.environment}"
    iothub_route_source                 = "DeviceMessages"
    iothub_route_condition              = "sensorID = 'PIR'"
    iothub_route_enabled                = "true"
    resource_group_name                 = module.resource_group.rg_name  
    iothub_name                         = module.iot_hub.iot_hub_name
    container_name                      = module.fablab_container.storage_container_name
    primary_blob_connection_string      = module.storage_account.storage_account_primary_blob_connection_string 
}

module "light_message_routing" {
    source                              = "./modules/iot_hub_message_routing"
    iothub_endpoint_name                = "Light_endpoint_${var.environment}"
    iothub_batch_frequency_in_seconds   = 300
    iothub_max_chunk_size_in_bytes      = 314572800
    iothub_endpoint_encoding            = "json"
    iothub_endpoint_file_name_format    = "{iothub}/{sensor}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}"
    iothub_route_name                   = "Light_route_${var.environment}"
    iothub_route_source                 = "DeviceMessages"
    iothub_route_condition              = "sensorID = 'S1'"
    iothub_route_enabled                = "true"
    resource_group_name                 = module.resource_group.rg_name 
    iothub_name                         = module.iot_hub.iot_hub_name
    container_name                      = module.fablab_container.storage_container_name
    primary_blob_connection_string      = module.storage_account.storage_account_primary_blob_connection_string
}

module "accelerometer_message_routing" {
    source                              = "./modules/iot_hub_message_routing"
    iothub_endpoint_name                = "Accelerometer_endpoint_${var.environment}"
    iothub_batch_frequency_in_seconds   = 300
    iothub_max_chunk_size_in_bytes      = 314572800
    iothub_endpoint_encoding            = "json"
    iothub_endpoint_file_name_format    = "{iothub}/{sensor}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}"
    iothub_route_name                   = "Accelerometer_route_${var.environment}"
    iothub_route_source                 = "DeviceMessages"
    iothub_route_condition              = "sensorID = 'Accelerometer'"
    iothub_route_enabled                = "true"
    resource_group_name                 = module.resource_group.rg_name 
    iothub_name                         = module.iot_hub.iot_hub_name
    container_name                      = module.fablab_container.storage_container_name
    primary_blob_connection_string      = module.storage_account.storage_account_primary_blob_connection_string 
}


module "temperature_humidity_message_routing" {
    source                              = "./modules/iot_hub_message_routing"
    iothub_endpoint_name                = "Temperature_Humidity_endpoint_${var.environment}"
    iothub_batch_frequency_in_seconds   = 300
    iothub_max_chunk_size_in_bytes      = 314572800
    iothub_endpoint_encoding            = "json"
    iothub_endpoint_file_name_format    = "{iothub}/{sensor}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}"
    iothub_route_name                   = "Temperature_Humidity_route_${var.environment}"
    iothub_route_source                 = "DeviceMessages"
    iothub_route_condition              = "sensorID = 'TEMP'"
    iothub_route_enabled                = "true"
    resource_group_name                 = module.resource_group.rg_name 
    iothub_name                         = module.iot_hub.iot_hub_name
    container_name                      = module.fablab_container.storage_container_name
    primary_blob_connection_string      = module.storage_account.storage_account_primary_blob_connection_string 
}



#### KEY VAULT ####



module "key_vault" {
  source                                = "./modules/key_vault"
  key_vault_name                        = "KVFL${var.environment}"
  key_vault_enabled_for_disk_encryption = "true"
  key_vault_soft_delete_retention_days  = 7
  key_vault_purge_protection_enabled    = "false"
  key_vault_sku_name                    = var.key_vault_sku_name
  resource_group_name                   = module.resource_group.rg_name 
  resource_group_location               = module.resource_group.rg_location  
}



#### KEY VAULT SECRET ####



module "key_vault_secret_fablabadminlogin" {
  source                 = "./modules/key_vault_secret"
  key_vault_secret_name  = "FLlogin${var.environment}"
  key_vault_secret_value = var.fablabadminlogin_secret_value 
  key_vault_id           = module.key_vault.key_vault_id
}

module "key_vault_secret_SQLDBsecret" {
  source                  = "./modules/key_vault_secret"
  key_vault_secret_name   = "SQLDBsecret${var.environment}"
  key_vault_secret_value  = var.SQLDB_secret_value 
  key_vault_id            = module.key_vault.key_vault_id
}

module "key_vault_secret_StorageAccountFabLab" {
  source                 = "./modules/key_vault_secret"
  key_vault_secret_name  = "SAFLsecret${var.environment}"
  key_vault_secret_value = var.StorageAccountFabLab_secret_value 
  key_vault_id           = module.key_vault.key_vault_id
}



#### SQL DATABASE ####



module "sql_database" {
  source                  = "./modules/sql_database"
  sql_database_name       = "sqldbfablab_${var.environment}"
  server_name             = module.sql_server.sql_server_name  
  resource_group_name     = module.resource_group.rg_name 
  resource_group_location = module.resource_group.rg_location
}



#### SQL SERVER ####



module "sql_server" {
  source                                  = "./modules/sql_server"
  sql_server_name                         = "sqlsfablab${var.environment}"
  sql_server_administrator_login          = var.sql_server_administrator_login
  sql_server_administrator_login_password = var.sql_server_administrator_login_password 
  storage_endpoint                        = module.storage_account.storage_account_primary_blob_endpoint
  storage_account_access_key              = module.storage_account.storage_account_primary_access_key 
  resource_group_name                     = module.resource_group.rg_name 
  resource_group_location                 = module.resource_group.rg_location
}



#### STORAGE ACCOUNT ####



module "storage_account" {
  source                                    = "./modules/storage_account"
  storage_account_name                      = "safablab${var.environment}"
  storage_account_account_replication_type  = "RAGRS"
  storage_account_account_tier              = var.storage_account_account_tier
  storage_account_account_kind              = var.storage_account_account_kind 
  resource_group_name                       = module.resource_group.rg_name
  resource_group_location                   = module.resource_group.rg_location
}



#### STORAGE CONTAINER ####



module "fablab_container" {
  source                          = "./modules/storage_container"
  storage_container_name          = "containerfablab${var.environment}"
  storage_account_name            = module.storage_account.storage_account_name 
}

module "archive_container" {
  source                          = "./modules/storage_container"
  storage_container_name          = "containerarchive${var.environment}"
  storage_account_name            = module.storage_account.storage_account_name
}

module "machine_learning_container" {
  source                          = "./modules/storage_container"
  storage_container_name          = "containerml${var.environment}"
  storage_account_name            = module.storage_account.storage_account_name
}



#### BLOB STORAGE ####



module "fablab_iot_hub_blob" {
  source                 = "./modules/blob_storage"
  blob_name              = "FabLabIoTHubBlob_${var.environment}"
  blob_type              = "Block"
  blob_access_tier       = "Hot"
  storage_account_name   = module.storage_account.storage_account_name
  storage_container_name = module.fablab_container.storage_container_name 
}

module "archive_blob" {
  source                 = "./modules/blob_storage"
  blob_name              = "ArchiveBlob_${var.environment}"
  blob_type              = "Block"
  blob_access_tier       = "Cool"
  storage_account_name   = module.storage_account.storage_account_name
  storage_container_name = module.archive_container.storage_container_name
}

module "machine_learning_blob" {
  source                 = "./modules/blob_storage"
  blob_name              = "MLBlob_${var.environment}"
  blob_type              = "Block"
  blob_access_tier       = "Cool"
  storage_account_name   = module.storage_account.storage_account_name
  storage_container_name = module.machine_learning_container.storage_container_name
}



#### DATA FACTORY ####



module "fablab_data_factory" {
  source                  = "./modules/data_factory"
  data_factory_name       = "adfFabLab-${var.environment}"
  resource_group_name     = module.resource_group.rg_name 
  resource_group_location = module.resource_group.rg_location 
}



#### DATA FACTORY PIPELINES ####



module "adf_motion_pipeline" {
  source                     = "./modules/data_factory_pipeline"
  data_factory_pipeline_name = "PL_DATA_Motionsensor_${var.environment}"
  resource_group_name        = module.resource_group.rg_name 
  data_factory_name          = module.fablab_data_factory.data_factory_name
}

module "adf_temperature_and_humidity_pipeline" {
  source                     = "./modules/data_factory_pipeline"
  resource_group_name        = module.resource_group.rg_name 
  data_factory_name          = module.fablab_data_factory.data_factory_name
  data_factory_pipeline_name = "PL_DATA_TempAndHum_${var.environment}"
}



#### DATA FACTORY DATASETS ####



module "adf_blob_motion_dataset" {
    source                               = "./modules/data_factory_dataset_blob"
    data_factory_dataset_azure_blob_name = "DS_ABLB_Motionsensor_${var.environment}"
    adf_ds_blob_path                     = "containerfablab${var.environment}/FabLabIoTHubBlob_${var.environment}/MotionSensor/**/**/**/**/**"
    adf_ds_blob_filename                 = "*.json"
    resource_group_name                  = module.resource_group.rg_name 
    data_factory_name                    = module.fablab_data_factory.data_factory_name 
    linked_service_name                  = module.adf_linked_service_blob_storage.blob_linked_service_name  
}

module "adf_blob_archive_dataset" {
    source                               = "./modules/data_factory_dataset_blob"
    data_factory_dataset_azure_blob_name = "DS_ABLB_Archive_${var.environment}"
    adf_ds_blob_path                     = "archive"
    adf_ds_blob_filename                 = "*.json"
    resource_group_name                  = module.resource_group.rg_name 
    data_factory_name                    = module.fablab_data_factory.data_factory_name 
    linked_service_name                  = module.adf_linked_service_blob_storage.blob_linked_service_name
}

module "adf_blob_delete_motion_dataset" {
    source                               = "./modules/data_factory_dataset_blob"
    data_factory_dataset_azure_blob_name = "DS_ABLB_DeleteMotion_${var.environment}"
    adf_ds_blob_path                     = "containerfablab${var.environment}/FabLabIoTHubBlob_${var.environment}/MotionSensor/**/**/**/**/**"
    adf_ds_blob_filename                 = "*.json"
    resource_group_name                  = module.resource_group.rg_name
    data_factory_name                    = module.fablab_data_factory.data_factory_name 
    linked_service_name                  = module.adf_linked_service_blob_storage.blob_linked_service_name
}

module "adf_blob_temperature_dataset" {
    source                               = "./modules/data_factory_dataset_blob"
    data_factory_dataset_azure_blob_name = "DS_ABLB_Temp_${var.environment}"
    adf_ds_blob_path                     = "blobstoragefablab/FabLabIoTHub/TempAndHum/**/**/**/**/**"
    adf_ds_blob_filename                 = "*.json"
    resource_group_name                  = module.resource_group.rg_name 
    data_factory_name                    = module.fablab_data_factory.data_factory_name 
    linked_service_name                  = module.adf_linked_service_blob_storage.blob_linked_service_name
}

module "adf_sql_motion_dbo" {
    source                                     = "./modules/data_factory_dataset_service_sql_server_table"
    data_factory_dataset_sql_server_table_name = "DS_ASQL_Motionsensordbo_${var.environment}"
    resource_group_name                        = module.resource_group.rg_name 
    data_factory_name                          = module.fablab_data_factory.data_factory_name 
    linked_service_name                        = module.adf_linked_service_sql_database.sql_linked_service_name
}

module "adf_sql_motion_staging" {
    source                                     = "./modules/data_factory_dataset_service_sql_server_table"
    data_factory_dataset_sql_server_table_name = "DS_ASQL_MotionsensorStaging_${var.environment}"
    resource_group_name                        = module.resource_group.rg_name 
    data_factory_name                          = module.fablab_data_factory.data_factory_name 
    linked_service_name                        = module.adf_linked_service_sql_database.sql_linked_service_name
}

module "adf_sql_temperature_and_humidity" {
    source                                     = "./modules/data_factory_dataset_service_sql_server_table"
    data_factory_dataset_sql_server_table_name = "DS_ASQL_TempAndHumStaging_${var.environment}"
    resource_group_name                        = module.resource_group.rg_name
    data_factory_name                          = module.fablab_data_factory.data_factory_name 
    linked_service_name                        = module.adf_linked_service_sql_database.sql_linked_service_name
}



#### DATA FACTORY LINKED SERVICE ####



module "adf_linked_service_blob_storage" {
    source                                                      = "./modules/data_factory_linked_service_azure_blob_storage"
    data_factory_linked_service_azure_blob_storage_name = "LS_ABLB_Motionsensor_${var.environment}"
    resource_group_name =module.resource_group.rg_name
    data_factory_name = module.fablab_data_factory.data_factory_name
    primary_blob_connection_string = module.storage_account.storage_account_primary_blob_connection_string
}

module "adf_linked_service_sql_database" {
    source                                                      = "./modules/data_factory_linked_service_azure_sql_database"
    data_factory_linked_service_azure_sql_database_name = "LS_ASQL_Motionsensor_${var.environment}"
    resource_group_name = module.resource_group.rg_name 
    data_factory_name = module.fablab_data_factory.data_factory_name
    connection_string = "data source=${module.sql_server.sql_server_name}.database.windows.net;initial catalog=${module.sql_database.sql_database_name};user id=${module.sql_server.sql_server_administrator_login};Password=${module.sql_server.sql_server_administrator_login_password};integrated security=False;encrypt=True;connection timeout=30" 
}

module "adf_linked_service_key_vault" {
    source                                             = "./modules/data_factory_linked_service_key_vault"
    data_factory_linked_service_key_vault_name = "LS_AKVT_Motionsensor_${var.environment}"
    resource_group_name = module.resource_group.rg_name
    data_factory_name = module.fablab_data_factory.data_factory_name
    key_vault_id        = module.key_vault.key_vault_id
}



#### DATA FACTORY TRIGGER ####



module "adf_motion_trigger" {
    source                                     = "./modules/data_factory_trigger_schedule"
    data_factory_trigger_schedule_name = "adf_motion_trigger_${var.environment}"
    adf_trigger_interval                       = 24
    adf_trigger_frequency                      = "Hour"
    resource_group_name = module.resource_group.rg_name 
    data_factory_name = module.fablab_data_factory.data_factory_name
    pipeline_name = module.adf_motion_pipeline.data_factory_pipeline_name
}

module "adf_temphum_trigger" {
    source                                     = "./modules/data_factory_trigger_schedule"
    data_factory_trigger_schedule_name = "adf_temphum_trigger_${var.environment}"
    adf_trigger_interval                       = 24
    adf_trigger_frequency                      = "Hour"
    resource_group_name = module.resource_group.rg_name
    data_factory_name = module.fablab_data_factory.data_factory_name
    pipeline_name = module.adf_temperature_and_humidity_pipeline.data_factory_pipeline_name
}