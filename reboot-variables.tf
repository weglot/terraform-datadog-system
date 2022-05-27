variable "reboot_enabled" {
  type    = bool
  default = true
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

variable "reboot_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "reboot_notification_channel_override" {
  type    = string
  default = ""
}
