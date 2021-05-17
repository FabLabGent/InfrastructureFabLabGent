variable "data_factory_trigger_schedule_name" {
    type = string
}

variable "adf_trigger_interval" {
    type = string
    description = "(Optional) The interval for how often the trigger occurs. This defaults to 1."
}

variable "adf_trigger_frequency" {
    type = string
    description = "(Optional) The trigger freqency. Valid values include Minute, Hour, Day, Week, Month. Defaults to Minute."
}

variable "data_factory_name" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "pipeline_name" {
    type = string
}