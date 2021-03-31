variable "dd_agent_enabled" {
  type    = bool
  default = true
}

variable "dd_agent_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "dd_agent_severity" {
  type    = string
  default = "major"
}

variable "dd_agent_priority" {
  type    = number
  default = null
}

variable "dd_agent_note" {
  type    = string
  default = ""
}

variable "dd_agent_docs" {
  type    = string
  default = "Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event"
}

variable "dd_agent_filter_override" {
  type    = string
  default = ""
}

variable "dd_agent_data_alerting_enabled" {
  type    = bool
  default = true
}
