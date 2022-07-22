locals {
  packets_out_errors_filter = coalesce(
    var.packets_out_errors_filter_override,
    var.filter_str
  )
}

module "packets_out_errors" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name = "System - Packet Out Errors"
  # +1000 helps out filtering low packet rates, this prevents a handful of packet errors to skew the percentage when for example only 100 packets are received/sent
  query            = "avg(${var.packets_out_errors_evaluation_period}):100 * max:system.net.packets_out.error{${local.packets_out_errors_filter}} by {${var.alert_by}} / ( max:system.net.packets_out.count{${local.packets_out_errors_filter}} by {${var.alert_by}} + 1000 ) > ${var.packets_out_errors_critical}"
  alert_message    = "High rate of packet-out errors on ${var.service} Node {{${var.alert_by}.name}} ({{value}} %)"
  recovery_message = "Packet-out error rate on ${var.service} Node {{${var.alert_by}.name}} Recovered ({{value}} %)"

  # monitor level vars
  enabled            = var.packets_out_errors_enabled
  alerting_enabled   = var.packets_out_errors_alerting_enabled
  warning_threshold  = var.packets_out_errors_warning
  critical_threshold = var.packets_out_errors_critical
  priority           = min(var.packets_out_errors_priority + var.priority_offset, 5)
  docs               = var.packets_out_errors_docs
  note               = var.packets_out_errors_note

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = try(coalesce(var.packets_out_errors_notification_channel_override, var.notification_channel), "")
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
