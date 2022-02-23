variable "disk_free_bytes_enabled" {
  type    = bool
  default = false
}

variable "disk_free_bytes_warning" {
  type    = number
  default = 20000000000 # 20GB
}

variable "disk_free_bytes_critical" {
  type    = number
  default = 10000000000 # 10GB
}

variable "disk_free_bytes_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "disk_free_bytes_note" {
  type    = string
  default = ""
}

variable "disk_free_bytes_docs" {
  type    = string
  default = ""
}

variable "disk_free_bytes_filter_override" {
  type    = string
  default = ""
}

variable "disk_free_bytes_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_free_bytes_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 1
}

variable "disk_free_bytes_notification_channel_override" {
  type    = string
  default = ""
}