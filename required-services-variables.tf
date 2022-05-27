variable "required_services_enabled" {
  type    = bool
  default = true
}

variable "required_services_config" {
  type    = map(map(string))
  default = {}
}

variable "required_services_default_freshness_duration" {
  type    = string
  default = "5m"
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

variable "required_services_default_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "required_services_notification_channel_override" {
  type    = string
  default = ""
}
