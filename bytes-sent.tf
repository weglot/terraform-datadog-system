locals {
  bytes_sent_filter = coalesce(
    var.bytes_sent_filter_override,
    var.filter_str
  )
}

module "bytes_sent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.0"

  name             = "System - Bytes sent"
  query            = "avg(${var.bytes_sent_evaluation_period}):avg:system.net.bytes_sent{${local.bytes_sent_filter}} by {host} > ${var.bytes_sent_critical}"
  alert_message    = "High egress traffic on ${var.service} Node {{host.name}} ({{value}})"
  recovery_message = "High egress traffic on ${var.service} Node {{host.name}} Recovered ({{value}})"

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked

  # monitor level vars
  enabled            = var.bytes_sent_enabled
  alerting_enabled   = var.bytes_sent_alerting_enabled
  warning_threshold  = var.bytes_sent_warning
  critical_threshold = var.bytes_sent_critical
  priority           = var.bytes_sent_priority
  severity           = var.bytes_sent_severity
  docs               = var.bytes_sent_docs
  note               = var.bytes_sent_note
  name_prefix        = var.bytes_sent_name_prefix
  name_suffix        = var.bytes_sent_name_suffix
}
