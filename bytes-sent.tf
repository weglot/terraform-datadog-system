locals {
  bytes_sent_filter = coalesce(
    var.bytes_sent_filter_override,
    var.filter_str
  )
}

module "bytes_sent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "System - Bytes sent"
  query = "avg(${var.bytes_sent_evaluation_period}):avg:system.net.bytes_sent{${local.bytes_sent_filter}} by {host} > ${var.bytes_sent_critical}"

  enabled          = var.bytes_sent_enabled
  alerting_enabled = var.bytes_sent_alerting_enabled

  alert_message    = "High egress traffic on ${var.service} Node {{host.name}} ({{value}})"
  recovery_message = "High egress traffic on ${var.service} Node {{host.name}} Recovered ({{value}})"

  service         = var.service
  env             = var.alert_env
  priority        = var.bytes_sent_priority
  severity        = var.bytes_sent_severity
  note            = var.bytes_sent_note
  docs            = var.bytes_sent_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.bytes_sent_critical
  warning_threshold  = var.bytes_sent_warning
}
