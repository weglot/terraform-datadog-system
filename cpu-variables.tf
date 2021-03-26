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

variable "cpu_severity" {
  type    = string
  default = "major"
}

variable "cpu_priority" {
  type    = number
  default = null
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
