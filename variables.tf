variable "env" {
  type = string
}

variable "alert_env" {
  type = string
}

variable "filter_str" {
  type = string
}

variable "service" {
  type    = string
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}
