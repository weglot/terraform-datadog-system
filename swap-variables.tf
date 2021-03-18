variable "swap_percent_free_enabled" {
  type    = bool
  default = true
}

variable "swap_percent_free_warning" {
  type    = number
  default = 20
  # 20 %
}

variable "swap_percent_free_critical" {
  type    = number
  default = 10
  # 10 %
}

variable "swap_percent_free_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "swap_percent_free_severity" {
  type    = string
  default = "minor"
}

variable "swap_percent_free_note" {
  type    = string
  default = ""
}

variable "swap_percent_free_docs" {
  type    = string
  default = ""
}

variable "swap_percent_free_filter_override" {
  type    = string
  default = ""
}

variable "swap_percent_free_alerting_enabled" {
  type    = bool
  default = true
}
