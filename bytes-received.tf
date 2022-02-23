locals {
  bytes_received_filter = coalesce(
    var.bytes_received_filter_override,
    var.filter_str
  )
}

module "bytes_received" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "System - Bytes received"
  query            = "avg(${var.bytes_received_evaluation_period}):avg:system.net.bytes_rcvd{${local.bytes_received_filter}} by {${var.alert_by}} > ${var.bytes_received_critical}"
  alert_message    = "High ingress traffic on ${var.service} Node {{host.name}} ({{value}})"
  recovery_message = "Ingress traffic on ${var.service} Node {{host.name}} Recovered ({{value}})"

  # monitor level vars
  enabled              = var.bytes_received_enabled
  alerting_enabled     = var.bytes_received_alerting_enabled
  warning_threshold    = var.bytes_received_warning
  critical_threshold   = var.bytes_received_critical
  priority             = min(var.bytes_received_priority + var.priority_offset, 5)
  docs                 = var.bytes_received_docs
  note                 = var.bytes_received_note
  notification_channel = try(coalesce(var.bytes_received_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
