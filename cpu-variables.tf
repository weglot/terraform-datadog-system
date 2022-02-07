variable "cpu_enabled" {
  type    = bool
  default = true
}

variable "cpu_warning" {
  type    = string
  default = "80"
}

variable "cpu_critical" {
  type    = string
  default = "95"
}

variable "cpu_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "cpu_note" {
  type    = string
  default = ""
}

variable "cpu_docs" {
  type    = string
  default = ""
}

variable "cpu_filter_override" {
  type    = string
  default = ""
}

variable "cpu_alerting_enabled" {
  type    = bool
  default = true
}

variable "cpu_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "cpu_notification_channel_override" {
  type    = string
  default = ""
}