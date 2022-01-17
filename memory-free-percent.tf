locals {
  memory_free_percent_filter = coalesce(
    var.memory_free_percent_filter_override,
    var.filter_str
  )
}

module "memory_free_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "System - Memory Free Percent"
  query            = "avg(${var.memory_free_percent_evaluation_period}):min:system.mem.pct_usable{${local.memory_free_percent_filter}} by {host} < ${var.memory_free_percent_critical}"
  alert_message    = "Available memory on ${var.service} Node {{host.name}} has dropped below {{threshold}} and has {{value}}% available"
  recovery_message = "Available memory on ${var.service} Node {{host.name}} has recovered {{value}}%"

  # monitor level vars
  enabled            = var.memory_free_percent_enabled
  alerting_enabled   = var.memory_free_percent_alerting_enabled
  warning_threshold  = var.memory_free_percent_warning
  critical_threshold = var.memory_free_percent_critical
  priority           = min(var.memory_free_percent_priority + var.priority_offset, 5)
  docs               = var.memory_free_percent_docs
  note               = var.memory_free_percent_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
