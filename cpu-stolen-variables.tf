variable "cpu_stolen_enabled" {
  type    = bool
  default = true
}

variable "cpu_stolen_warning" {
  type    = string
  default = "5"
}

variable "cpu_stolen_critical" {
  type    = string
  default = "10"
}

variable "cpu_stolen_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "cpu_stolen_note" {
  type    = string
  default = ""
}

variable "cpu_stolen_docs" {
  type    = string
  default = ""
}

variable "cpu_stolen_filter_override" {
  type    = string
  default = ""
}

variable "cpu_stolen_alerting_enabled" {
  type    = bool
  default = true
}

variable "cpu_stolen_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "cpu_stolen_notification_channel_override" {
  type    = string
  default = ""
}
