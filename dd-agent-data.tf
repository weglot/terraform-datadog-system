locals {
  dd_agent_data_filter_coalesced = coalesce(
    var.dd_agent_data_filter_override,
    var.filter_str
  )

  dd_agent_data_filter_splitted = split(",", local.dd_agent_data_filter_coalesced)
  dd_agent_data_filter_newlist  = [for tag in local.dd_agent_data_filter_splitted : "\"${tag}\""]
  dd_agent_data_filter          = join(",", local.dd_agent_data_filter_newlist)
}

module "dd_agent_data" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  type  = "service check"
  name  = "System - Datadog data missing"
  query = "\"datadog.agent.up\".over(${local.dd_agent_data_filter}).by(\"host\").last(${var.dd_agent_data_freshness_minutes}).count_by_status()"

  enabled          = var.dd_agent_data_enabled
  alerting_enabled = var.dd_agent_data_alerting_enabled

  alert_message    = "Datadog Agent not running is not running on ${var.service} Node {{host.name}} please check."
  recovery_message = "Datadog Agent is back on ${var.service} Node {{host.name}}"

  service         = var.service
  env             = var.alert_env
  priority        = var.dd_agent_data_priority
  severity        = var.dd_agent_data_severity
  note            = var.dd_agent_data_note
  docs            = var.dd_agent_data_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = false
  no_data_timeframe   = 2
  notify_no_data      = true
  locked              = var.locked

  critical_threshold = 1
  warning_threshold  = 1
  ok_threshold       = 1
}
