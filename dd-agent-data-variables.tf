variable "dd_agent_data_enabled" {
  type    = bool
  default = true
}

variable "dd_agent_data_freshness_minutes" {
  type    = number
  default = 15
}

variable "dd_agent_data_severity" {
  type    = string
  default = "major"
}

variable "dd_agent_data_priority" {
  type    = number
  default = null
}

variable "dd_agent_data_note" {
  type    = string
  default = ""
}

variable "dd_agent_data_docs" {
  type    = string
  default = "Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event"
}

variable "dd_agent_data_filter_override" {
  type    = string
  default = ""
}

variable "dd_agent_alerting_enabled" {
  type    = bool
  default = true
}

variable "dd_agent_name_prefix" {
  type    = string
  default = ""
}

variable "dd_agent_name_suffix" {
  type    = string
  default = ""
}

variable "dd_agent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}