variable "packets_out_errors_enabled" {
  type    = bool
  default = true
}

variable "packets_out_errors_warning" {
  type    = number
  default = 0.5
  # 0.5%
}

variable "packets_out_errors_critical" {
  type    = number
  default = 1
  # 1%
}

variable "packets_out_errors_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "packets_out_errors_severity" {
  type    = string
  default = "minor"
}

variable "packets_out_errors_note" {
  type    = string
  default = ""
}

variable "packets_out_errors_docs" {
  type    = string
  default = "Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/"
}

variable "packets_out_errors_filter_override" {
  type    = string
  default = ""
}

variable "packets_out_errors_alerting_enabled" {
  type    = bool
  default = true
}

variable "packets_out_errors_prefix" {
  type    = string
  default = ""
}

variable "packets_out_errors_suffix" {
  type    = string
  default = ""
}

variable "packets_out_errors_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}