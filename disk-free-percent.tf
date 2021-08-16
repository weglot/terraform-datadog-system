locals {
  disk_free_percent_filter = coalesce(
    var.disk_free_percent_filter_override,
    var.filter_str
  )
}

module "disk_free_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.6.2"

  name             = "System - Disk Free (percentage)"
  query            = "avg(${var.disk_free_percent_evaluation_period}):100 * min:system.disk.free{${local.disk_free_percent_filter}} by {host,device} / min:system.disk.total{${local.disk_free_percent_filter}} < ${var.disk_free_percent_critical}"
  alert_message    = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has dropped below {{threshold}} ( {{device.name}}  has {{value}}% available on {{host.name}} )"
  recovery_message = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has recovered ( {{device.name}}  has {{value}}% available on {{host.name}} )"

  # monitor level vars
  enabled            = var.disk_free_percent_enabled
  alerting_enabled   = var.disk_free_percent_alerting_enabled
  warning_threshold  = var.disk_free_percent_warning
  critical_threshold = var.disk_free_percent_critical
  priority           = var.disk_free_percent_priority
  docs               = var.disk_free_percent_docs
  note               = var.disk_free_percent_note

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
