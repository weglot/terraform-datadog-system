locals {
  memory_free_percent_filter = coalesce(
    var.memory_free_percent_filter_override,
    var.filter_str
  )
}

module "memory_free_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "System - Memory Free Percent"
  query = "avg(${var.memory_free_percent_evaluation_period}):( min:system.mem.free{${local.memory_free_percent_filter}} by {host} / avg:system.mem.total{${local.memory_free_percent_filter}} by {host} ) * 100 < ${var.memory_free_percent_critical}"

  enabled          = var.memory_free_percent_enabled
  alerting_enabled = var.memory_free_percent_alerting_enabled

  alert_message    = "Available memory on ${var.service} Node {{host.name}} has dropped below {{threshold}} and has {{value}}% available"
  recovery_message = "Available memory on ${var.service} Node {{host.name}} has recovered {{value}}%"

  service         = var.service
  env             = var.alert_env
  priority        = var.memory_free_percent_priority
  severity        = var.memory_free_percent_severity
  note            = var.memory_free_percent_note
  docs            = var.memory_free_percent_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.memory_free_percent_critical
  warning_threshold  = var.memory_free_percent_warning
}
