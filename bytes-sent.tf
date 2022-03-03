locals {
  bytes_sent_filter = coalesce(
    var.bytes_sent_filter_override,
    var.filter_str
  )
}

module "bytes_sent" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "System - Bytes sent"
  query            = "avg(${var.bytes_sent_evaluation_period}):avg:system.net.bytes_sent{${local.bytes_sent_filter}} by {${var.alert_by}} > ${var.bytes_sent_critical}"
  alert_message    = "High egress traffic on ${var.service} Node {{${var.alert_by}.name}} ({{value}})"
  recovery_message = "High egress traffic on ${var.service} Node {{${var.alert_by}.name}} Recovered ({{value}})"

  # monitor level vars
  enabled              = var.bytes_sent_enabled
  alerting_enabled     = var.bytes_sent_alerting_enabled
  warning_threshold    = var.bytes_sent_warning
  critical_threshold   = var.bytes_sent_critical
  priority             = min(var.bytes_sent_priority + var.priority_offset, 5)
  docs                 = var.bytes_sent_docs
  note                 = var.bytes_sent_note
  notification_channel = try(coalesce(var.bytes_sent_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
