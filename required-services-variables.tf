variable "required_services_config" {
  type    = map(map(string))
  default = {}
}

variable "required_services_default_freshness_duration" {
  type    = string
  default = "5m"
}

variable "required_services_default_severity" {
  type    = string
  default = "major"
}

variable "required_services_default_priority" {
  type    = number
  default = null
}

variable "required_services_default_note" {
  type    = string
  default = ""
}

variable "required_services_default_docs" {
  type    = string
  default = ""
}

variable "required_services_filter_override" {
  type    = string
  default = ""
}

variable "required_services_alerting_enabled" {
  type    = bool
  default = true
}
