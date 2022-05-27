variable "dd_agent_data_enabled" {
  type    = bool
  default = true
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

variable "dd_agent_data_include_tags_override" {
  type    = list(string)
  default = null
}

variable "dd_agent_data_exclude_tags_override" {
  type    = list(string)
  default = null
}

variable "dd_agent_data_alerting_enabled" {
  type    = bool
  default = true
}

variable "dd_agent_data_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}

variable "dd_agent_data_notification_channel_override" {
  type    = string
  default = ""
}
