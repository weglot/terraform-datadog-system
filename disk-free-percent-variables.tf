variable "disk_free_percent_enabled" {
  type    = bool
  default = true
}

variable "disk_free_percent_warning" {
  type    = number
  default = 20
  # 20 %
}

variable "disk_free_percent_critical" {
  type    = number
  default = 10
  # 10 %
}

variable "disk_free_percent_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "disk_free_percent_note" {
  type    = string
  default = ""
}

variable "disk_free_percent_docs" {
  type    = string
  default = ""
}

variable "disk_free_percent_filter_override" {
  type    = string
  default = ""
}

variable "disk_free_percent_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_free_percent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "disk_free_percent_notification_channel_override" {
  type    = string
  default = ""
}
