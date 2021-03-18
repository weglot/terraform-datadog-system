variable "disk_free_enabled" {
  type    = bool
  default = true
}

variable "disk_free_warning" {
  type    = number
  default = 25
  # 25 %
}

variable "disk_free_critical" {
  type    = number
  default = 10
  # 10 %
}

variable "disk_free_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "disk_free_severity" {
  type    = string
  default = "critical"
}

variable "disk_free_note" {
  type    = string
  default = ""
}

variable "disk_free_docs" {
  type    = string
  default = ""
}

variable "disk_free_filter_override" {
  type    = string
  default = ""
}

variable "disk_free_alerting_enabled" {
  type    = bool
  default = true
}
