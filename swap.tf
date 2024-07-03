locals {
  swap_percent_free_filter = coalesce(
    var.swap_percent_free_filter_override,
    var.filter_str
  )
}

module "swap_percent_free" {
  source  = "weglot/generic-monitor/datadog"
  version = "1.1.0"

  name                = "System - Swap percent free"
  query               = "avg(${var.swap_percent_free_evaluation_period}):min:system.swap.pct_free{${local.swap_percent_free_filter}} by {${var.alert_by}} * 100 < ${var.swap_percent_free_critical}"
  alert_message       = "Swap memory percent free on ${var.service} Node {{${var.alert_by}.name}} is low ({{value}}%))"
  recovery_message    = "Swap memory percent free on ${var.service} Node {{${var.alert_by}.name}} has recovered ({{value}}%))"
  require_full_window = false

  # monitor level vars
  enabled              = var.swap_percent_free_enabled
  alerting_enabled     = var.swap_percent_free_alerting_enabled
  warning_threshold    = var.swap_percent_free_warning
  critical_threshold   = var.swap_percent_free_critical
  priority             = min(var.swap_percent_free_priority + var.priority_offset, 5)
  docs                 = var.swap_percent_free_docs
  note                 = var.swap_percent_free_note
  notification_channel = try(coalesce(var.swap_percent_free_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
  restricted_roles     = var.restricted_roles
}
