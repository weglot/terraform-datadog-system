variable "ntp_check_enabled" {
  type    = bool
  default = true
}

variable "ntp_check_alerting_enabled" {
  type    = bool
  default = true
}

variable "ntp_check_name_prefix" {
  type    = string
  default = ""
}

variable "ntp_check_name_suffix" {
  type    = string
  default = ""
}
