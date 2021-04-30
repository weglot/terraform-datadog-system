variable "reboot_enabled" {
  type    = bool
  default = true
}

variable "reboot_severity" {
  type    = string
  default = "critical"
}

variable "reboot_priority" {
  type    = number
  default = null
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

variable "reboot_name_prefix" {
  type    = string
  default = ""
}

variable "reboot_name_suffix" {
  type    = string
  default = ""
}

variable "reboot_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}