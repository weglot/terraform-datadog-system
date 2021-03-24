locals {
  disk_free_filter = coalesce(
  var.disk_free_filter_override,
  var.filter_str
  )
}

module "disk_free" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.4"

  name  = "System - Disk Free"
  query = "avg(${var.disk_free_evaluation_period}):( min:system.disk.free{${local.disk_free_filter}} by {host,device} / min:system.disk.total{${local.disk_free_filter}} by {host,device} ) * 100 < ${var.disk_free_critical}"

  enabled          = var.disk_free_enabled
  alerting_enabled = var.disk_free_alerting_enabled

  alert_message    = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has dropped below {{threshold}} ( {{device.name}}  has {{value}}% available on {{host.name}} )"
  recovery_message = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has recovered ( {{device.name}}  has {{value}}% available on {{host.name}} )"

  service         = var.service
  env             = var.alert_env
  severity        = var.disk_free_severity
  note            = var.disk_free_note
  docs            = var.disk_free_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.disk_free_critical
  warning_threshold  = var.disk_free_warning
}
