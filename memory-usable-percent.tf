locals {
  memory_usable_percent_filter = coalesce(
    var.memory_usable_percent_filter_override,
    var.filter_str
  )
}

module "memory_usable_percent" {
  source  = "weglot/generic-monitor/datadog"
  version = "1.1.0"

  name  = "Memory Usable Percent"
  query = "avg(${var.memory_usable_percent_evaluation_period}):100 * min:system.mem.usable{${local.memory_usable_percent_filter}} by {${var.alert_by}} / min:system.mem.total{${local.memory_usable_percent_filter}} by {${var.alert_by}} < ${var.memory_usable_percent_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Usable memory on CloudAMQP Node {{${var.alert_by}.name}} has dropped below {{threshold}} and has {{value}}% available"
  recovery_message    = "Usable memory on CloudAMQP Node {{${var.alert_by}.name}} has recovered {{value}}%"

  # monitor level vars
  enabled              = var.memory_usable_percent_enabled
  alerting_enabled     = var.memory_usable_percent_alerting_enabled
  warning_threshold    = var.memory_usable_percent_warning
  critical_threshold   = var.memory_usable_percent_critical
  priority             = min(var.memory_usable_percent_priority + var.priority_offset, 5)
  docs                 = var.memory_usable_percent_docs
  note                 = var.memory_usable_percent_note
  notification_channel = try(coalesce(var.memory_usable_percent_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
  restricted_roles     = var.restricted_roles
}
