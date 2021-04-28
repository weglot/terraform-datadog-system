locals {
  disk_free_filter = coalesce(
  var.disk_free_filter_override,
  var.filter_str
  )
}

module "disk_free" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5.3"

  name  = "System - Disk Free"
  query = "avg(${var.disk_free_evaluation_period}):( min:system.disk.free{${local.disk_free_filter}} by {host,device} / min:system.disk.total{${local.disk_free_filter}} by {host,device} ) * 100 < ${var.disk_free_critical}"
  alert_message    = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has dropped below {{threshold}} ( {{device.name}}  has {{value}}% available on {{host.name}} )"
  recovery_message = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has recovered ( {{device.name}}  has {{value}}% available on {{host.name}} )"

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked

  # monitor level vars
  enabled            = var.disk_free_enabled
  alerting_enabled   = var.disk_free_alerting_enabled
  warning_threshold  = var.disk_free_warning
  critical_threshold = var.disk_free_critical
  priority           = var.disk_free_priority
  severity           = var.disk_free_severity
  docs               = var.disk_free_docs
  note               = var.disk_free_note
  name_prefix        = var.disk_free_name_prefix
  name_suffix        = var.disk_free_name_suffix
}
