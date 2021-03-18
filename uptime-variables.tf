variable "reboot_enabled" {
  type    = bool
  default = true
}

variable "reboot_severity" {
  type    = string
  default = "critical"
}

variable "reboot_note" {
  type    = string
  default = ""
}

variable "reboot_docs" {
  type    = string
  default = ""
}

variable "reboot_filter_override" {
  type    = string
  default = ""
}

variable "reboot_alerting_enabled" {
  type    = bool
  default = true
}
