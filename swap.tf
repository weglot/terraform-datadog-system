locals {
  swap_percent_free_filter = coalesce(
    var.swap_percent_free_filter_override,
    var.filter_str
  )
}

module "swap_percent_free" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "System - Swap percent free"
  query = "avg(${var.swap_percent_free_evaluation_period}):min:system.swap.pct_free{${local.swap_percent_free_filter}} by {host} * 100 < ${var.swap_percent_free_critical}"

  enabled          = var.swap_percent_free_enabled
  alerting_enabled = var.swap_percent_free_alerting_enabled

  alert_message    = "Swap memory percent free on ${var.service} Node {{host.name}} is low ({{value}}%))"
  recovery_message = "Swap memory percent free on ${var.service} Node {{host.name}} has recovered ({{value}}%))"

  service         = var.service
  env             = var.alert_env
  priority        = var.swap_percent_free_priority
  severity        = var.swap_percent_free_severity
  note            = var.swap_percent_free_note
  docs            = var.swap_percent_free_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = false
  locked              = var.locked

  critical_threshold = var.swap_percent_free_critical
  warning_threshold  = var.swap_percent_free_warning
}
