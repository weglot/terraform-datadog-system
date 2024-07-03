variable "env" {
  type = string
}

variable "filter_str" {
  type = string
}

variable "service" {
  description = "Service name of what you're monitoring. This also sets the service:<service> tag on the monitor"
  type        = string
}

variable "service_display_name" {
  type    = string
  default = null
}

variable "notification_channel" {
  description = "Channel to which datadog sends alerts, will be overridden by alerting_enabled if that's set to false"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags"
  type        = list(string)
  default     = []
}

variable "name_prefix" {
  description = "Can be used to prefix to the Monitor name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Can be used to suffix to the Monitor name"
  type        = string
  default     = ""
}

variable "restricted_roles" {
  description = "A list of unique role identifiers to define which roles are allowed to edit the monitor"
  type        = list(string)
  default     = []
}

# The default values for the following two variables can be found in the
# locals.tf file. As a local, the fallback contain references to other
# variables.
variable "service_check_include_tags" {
  description = "List of tags for the \"over\" part of the query. Can be either key:value tags or boolean tags."
  type        = list(string)
  default     = null
}

variable "service_check_exclude_tags" {
  description = "List of tags for the \"exclude\" part of the query. Can be either key:value tags or boolean tags."
  type        = list(string)
  default     = null
}

variable "priority_offset" {
  description = "For non production workloads we can +1 on the priorities"
  type        = number
  default     = 0
}

variable "alert_by" {
  description = "This determines if you want an alert for each value of a tag, ex: by {host} -> generates an alert per host"
  type        = string
  default     = "host"
}
