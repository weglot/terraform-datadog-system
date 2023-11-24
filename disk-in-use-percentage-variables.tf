variable "disk_in_use_percentage_enabled" {
  type    = bool
  default = false
}

variable "disk_in_use_percentage_warning" {
  type    = number
  default = 80
  # 80%
}

variable "disk_in_use_percentage_critical" {
  type    = number
  default = 90
  # 90%
}

variable "disk_in_use_percentage_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "disk_in_use_percentage_note" {
  type    = string
  default = "system.disk.in_use is actually a fraction, we've multiplied it by 100 to make it a percentage"
}

variable "disk_in_use_percentage_docs" {
  type    = string
  default = "Default disabled, only use when disk_free_percent is not giving results"
}

variable "disk_in_use_percentage_filter_override" {
  type    = string
  default = ""
}

variable "disk_in_use_percentage_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_in_use_percentage_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "disk_in_use_percentage_notification_channel_override" {
  type    = string
  default = ""
}
