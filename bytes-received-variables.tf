variable "bytes_received_enabled" {
  type    = bool
  default = true
}

variable "bytes_received_warning" {
  type    = number
  default = 4000000
  # 4 MB
}

variable "bytes_received_critical" {
  type    = number
  default = 5000000
  # 5 MB
}

variable "bytes_received_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "bytes_received_severity" {
  type    = string
  default = "minor"
}

variable "bytes_received_priority" {
  type    = number
  default = null
}

variable "bytes_received_note" {
  type    = string
  default = ""
}

variable "bytes_received_docs" {
  type    = string
  default = ""
}

variable "bytes_received_filter_override" {
  type    = string
  default = ""
}

variable "bytes_received_alerting_enabled" {
  type    = bool
  default = true
}
