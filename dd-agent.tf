locals {
  dd_agent_filter = coalesce(
    var.dd_agent_filter_override,
    var.filter_str
  )
}

module "dd_agent" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "System - Datadog agent not running"
  query            = "avg(${var.dd_agent_evaluation_period}):avg:datadog.agent.running{${local.dd_agent_filter}} by {${var.alert_by}} < 1"
  alert_message    = "Datadog Agent is not running on ${var.service} Node {{${var.alert_by}.name}} please check."
  recovery_message = "Datadog Agent is back on ${var.service} Node {{${var.alert_by}.name}}"

  # monitor level vars
  enabled          = var.dd_agent_enabled
  alerting_enabled = var.dd_agent_alerting_enabled
  # no warning possible
  critical_threshold   = 1
  priority             = min(var.dd_agent_priority + var.priority_offset, 5)
  docs                 = var.dd_agent_docs
  note                 = var.dd_agent_note
  notification_channel = try(coalesce(var.dd_agent_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
