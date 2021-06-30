variable "bytes_sent_enabled" {
  type    = bool
  default = true
}

variable "bytes_sent_warning" {
  type    = number
  default = 4000000
  # 4 MB
}

variable "bytes_sent_critical" {
  type    = number
  default = 5000000
  # 5 MB
}

variable "bytes_sent_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "bytes_sent_note" {
  type    = string
  default = ""
}

variable "bytes_sent_docs" {
  type    = string
  default = ""
}

variable "bytes_sent_filter_override" {
  type    = string
  default = ""
}

variable "bytes_sent_alerting_enabled" {
  type    = bool
  default = true
}

variable "bytes_sent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}