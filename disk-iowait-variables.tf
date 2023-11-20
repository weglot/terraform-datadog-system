variable "disk_io_wait_enabled" {
  type    = bool
  default = true
}

variable "disk_io_wait_warning" {
  type    = number
  default = 80
  # 80 %
}

variable "disk_io_wait_critical" {
  type    = number
  default = 95
  # 95 %
}

variable "disk_io_wait_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "disk_io_wait_note" {
  type    = string
  default = ""
}

variable "disk_io_wait_docs" {
  type    = string
  default = "The CPU is mainly waiting for data to be written on disk. This means in general that application running on this machine is stalled"
}

variable "disk_io_wait_filter_override" {
  type    = string
  default = ""
}

variable "disk_io_wait_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_io_wait_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "disk_io_wait_notification_channel_override" {
  type    = string
  default = ""
}
