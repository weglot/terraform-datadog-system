variable "memory_free_percent_enabled" {
  type    = bool
  default = true
}

variable "memory_free_percent_warning" {
  type    = number
  default = 20
  # 20 %
}

variable "memory_free_percent_critical" {
  type    = number
  default = 10
  # 10 %
}

variable "memory_free_percent_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "memory_free_percent_severity" {
  type    = string
  default = "critical"
}

variable "memory_free_percent_priority" {
  type    = number
  default = null
}

variable "memory_free_percent_note" {
  type    = string
  default = ""
}

variable "memory_free_percent_docs" {
  type    = string
  default = ""
}

variable "memory_free_percent_filter_override" {
  type    = string
  default = ""
}

variable "memory_free_percent_alerting_enabled" {
  type    = bool
  default = true
}
