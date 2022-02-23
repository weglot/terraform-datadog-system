variable "memory_usable_percent_enabled" {
  type    = bool
  default = false
}

variable "memory_usable_percent_warning" {
  type    = number
  default = 20
  # 20 %
}

variable "memory_usable_percent_critical" {
  type    = number
  default = 10
  # 10 %
}

variable "memory_usable_percent_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_usable_percent_note" {
  type    = string
  default = ""
}

variable "memory_usable_percent_docs" {
  type    = string
  default = "This looks at system.mem.usable, only use this when memory_free_percent doesn't have data"
}

variable "memory_usable_percent_filter_override" {
  type    = string
  default = ""
}

variable "memory_usable_percent_alerting_enabled" {
  type    = bool
  default = true
}

variable "memory_usable_percent_no_data_timeframe" {
  type    = number
  default = null
}

variable "memory_usable_percent_notify_no_data" {
  type    = bool
  default = false
}

variable "memory_usable_percent_ok_threshold" {
  type    = number
  default = null
}

variable "memory_usable_percent_name_prefix" {
  type    = string
  default = ""
}

variable "memory_usable_percent_name_suffix" {
  type    = string
  default = ""
}

variable "memory_usable_percent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "memory_usable_percent_notification_channel_override" {
  type    = string
  default = ""
}
