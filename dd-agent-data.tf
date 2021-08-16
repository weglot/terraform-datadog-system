module "dd_agent_data" {
  source = "git@github.com:kabisa/terraform-datadog-service-check-monitor.git?ref=1.2.0.rc1"

  name       = "System - Datadog data missing"
  check_name = "datadog.agent.up"
  by_tags    = ["host"]

  include_tags = coalesce(
    var.dd_agent_data_include_tags_override,
    var.service_check_include_tags,
    []
  )

  exclude_tags = coalesce(
    var.dd_agent_data_exclude_tags_override,
    var.service_check_exclude_tags,
    []
  )

  alert_message    = "Datadog Agent not running is not running on ${var.service} Node {{host.name}} please check."
  recovery_message = "Datadog Agent is back on ${var.service} Node {{host.name}}"

  require_full_window = false
  no_data_timeframe   = 2
  notify_no_data      = true

  # monitor level vars
  enabled            = var.dd_agent_data_enabled
  alerting_enabled   = var.dd_agent_data_alerting_enabled
  critical_threshold = 1
  warning_threshold  = 1
  ok_threshold       = 1
  priority           = var.dd_agent_data_priority
  docs               = var.dd_agent_data_docs
  note               = var.dd_agent_data_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
