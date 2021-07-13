locals {
  dd_agent_filter = coalesce(
    var.dd_agent_filter_override,
    var.filter_str
  )
}

module "dd_agent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name             = "System - Datadog agent not running"
  query            = "avg(${var.dd_agent_evaluation_period}):avg:datadog.agent.running{${local.dd_agent_filter}} by {host} < 1"
  alert_message    = "Datadog Agent not running is not running on ${var.service} Node {{host.name}} please check."
  recovery_message = "Datadog Agent is back on ${var.service} Node {{host.name}}"

  # monitor level vars
  enabled          = var.dd_agent_enabled
  alerting_enabled = var.dd_agent_alerting_enabled
  # no warning possible
  critical_threshold = 1
  priority           = var.dd_agent_priority
  docs               = var.dd_agent_docs
  note               = var.dd_agent_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
