locals {
  bytes_received_filter = coalesce(
  var.bytes_received_filter_override,
  var.filter_str
  )
}

module "bytes_received" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5.3"

  name  = "System - Bytes received"
  query = "avg(${var.bytes_received_evaluation_period}):avg:system.net.bytes_rcvd{${local.bytes_received_filter}} by {host} > ${var.bytes_received_critical}"
  alert_message    = "High ingress traffic on ${var.service} Node {{host.name}} ({{value}})"
  recovery_message = "Ingress traffic on ${var.service} Node {{host.name}} Recovered ({{value}})"

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked

  # monitor level vars
  enabled            = var.bytes_received_enabled
  alerting_enabled   = var.bytes_received_alerting_enabled
  warning_threshold  = var.bytes_received_warning
  critical_threshold = var.bytes_received_critical
  priority           = var.bytes_received_priority
  severity           = var.bytes_received_severity
  docs               = var.bytes_received_docs
  note               = var.bytes_received_note
  name_prefix        = var.bytes_received_name_prefix
  name_suffix        = var.bytes_received_name_suffix
}
