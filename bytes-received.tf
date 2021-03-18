locals {
  bytes_received_filter = coalesce(
    var.bytes_received_filter_override,
    var.filter_str
  )
}

module "bytes_received" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.2"

  name  = "System - Bytes received"
  query = "avg(${var.bytes_received_evaluation_period}):avg:system.net.bytes_rcvd{${local.bytes_received_filter}} by {host} > ${var.bytes_received_critical}"

  enabled          = var.bytes_received_enabled
  alerting_enabled = var.bytes_received_alerting_enabled

  alert_message    = "High ingress traffic on ${var.service} Node {{host.name}} ({{value}})"
  recovery_message = "Ingress traffic on ${var.service} Node {{host.name}} Recovered ({{value}})"

  service         = var.service
  env             = var.alert_env
  severity        = var.bytes_received_severity
  note            = var.bytes_received_note
  docs            = var.bytes_received_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true

  critical_threshold = var.bytes_received_critical
  warning_threshold  = var.bytes_received_warning
}
