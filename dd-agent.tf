locals {
  dd_agent_filter = coalesce(
  var.dd_agent_filter_override,
  var.filter_str
  )
}

module "dd_agent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.4"

  name  = "System - Datadog agent not running"
  query = "avg(${var.dd_agent_evaluation_period}):avg:datadog.agent.running{${local.dd_agent_filter}} by {host} < 1"

  enabled          = var.dd_agent_enabled
  alerting_enabled = var.dd_agent_alerting_enabled

  alert_message    = "Datadog Agent not running is not running on ${var.service} Node {{host.name}} please check."
  recovery_message = "Datadog Agent is back on ${var.service} Node {{host.name}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.dd_agent_severity
  note            = var.dd_agent_note
  docs            = var.dd_agent_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = 1
}
