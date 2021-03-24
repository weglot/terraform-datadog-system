locals {
  memory_free_bytes_filter = coalesce(
    var.memory_free_bytes_filter_override,
    var.filter_str
  )
}

module "memory_free_bytes" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.4"

  name  = "System - Memory Free Bytes"
  query = "avg(${var.memory_free_bytes_evaluation_period}):min:system.mem.free{${local.memory_free_bytes_filter}} by {host} < ${var.memory_free_bytes_critical}"

  enabled          = var.memory_free_bytes_enabled
  alerting_enabled = var.memory_free_bytes_alerting_enabled

  alert_message    = "Available memory on ${var.service} Node {{host.name}} has dropped below {{threshold}} and has {{value}} available"
  recovery_message = "Available memory on ${var.service} Node {{host.name}} has recovered {{value}}"

  service         = var.service
  env             = var.alert_env
  severity        = var.memory_free_bytes_severity
  note            = var.memory_free_bytes_note
  docs            = var.memory_free_bytes_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked = var.locked

  critical_threshold = var.memory_free_bytes_critical
  warning_threshold  = var.memory_free_bytes_warning
}
