locals {
  dd_agent_data_filter_coalesced = coalesce(
    var.dd_agent_data_filter_override,
    var.filter_str
  )

  dd_agent_data_filter = split(",", local.dd_agent_data_filter_coalesced)

  dd_agent_data_over    = join(",", [for tag in local.dd_agent_data_filter : "\"${tag}\"" if length(regexall("^!", tag)) == 0])
  dd_agent_data_exclude = join(",", [for tag in local.dd_agent_data_filter : "\"${trimprefix(tag, "!")}\"" if length(regexall("^!", tag)) > 0])

  dd_agent_data_over_modifier    = length(local.dd_agent_data_over) > 0 ? ".over(${local.dd_agent_data_over})" : ""
  dd_agent_data_exclude_modifier = length(local.dd_agent_data_exclude) > 0 ? ".exclude(${local.dd_agent_data_exclude})" : ""

  dd_agent_data_modifiers = compact([
    local.dd_agent_data_over_modifier,
    local.dd_agent_data_exclude_modifier,
    ".by(\"host\")",
    ".last(${var.dd_agent_data_freshness_minutes})"
  ])
}

module "dd_agent_data" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  type                = "service check"
  name                = "System - Datadog data missing"
  query               = "\"datadog.agent.up\"${join("", local.dd_agent_data_modifiers)}.count_by_status()"
  alert_message       = "Datadog Agent not running is not running on ${var.service} Node {{host.name}} please check."
  recovery_message    = "Datadog Agent is back on ${var.service} Node {{host.name}}"
  require_full_window = false
  no_data_timeframe   = 2
  notify_no_data      = true

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked

  # monitor level vars
  enabled            = var.dd_agent_data_enabled
  alerting_enabled   = var.dd_agent_data_alerting_enabled
  critical_threshold = 1
  warning_threshold  = 1
  ok_threshold       = 1
  priority           = var.dd_agent_data_priority
  severity           = var.dd_agent_data_severity
  docs               = var.dd_agent_data_docs
  note               = var.dd_agent_data_note
  name_prefix        = var.dd_agent_data_name_prefix
  name_suffix        = var.dd_agent_data_name_suffix
}
