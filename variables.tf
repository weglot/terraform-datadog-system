variable "env" {
  type = string
}

variable "alert_env" {
  type = string
}

variable "filter_str" {
  type = string
}

variable "service" {
  type = string
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}

variable "locked" {
  type    = bool
  default = true
}

# The default values for the following two variables can be found in the
# locals.tf file. As a local, the fallback contain references to other
# variables.
variable "service_check_include_tags" {
  type    = list(string)
  default = null
}

variable "service_check_exclude_tags" {
  type    = list(string)
  default = null
}
