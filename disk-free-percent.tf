locals {
  disk_free_percent_filter = coalesce(
    var.disk_free_percent_filter_override,
    var.filter_str
  )
}

module "disk_free_percent" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name             = "System - Disk Free (percentage)"
  query            = "avg(${var.disk_free_percent_evaluation_period}):100 * min:system.disk.free{${local.disk_free_percent_filter}} by {host,device} / min:system.disk.total{${local.disk_free_percent_filter}} by {host,device} < ${var.disk_free_percent_critical}"
  alert_message    = "Available disk volume {{device.name}} on ${var.service} Node {{${var.alert_by}.name}} has dropped below {{threshold}} ( {{device.name}}  has {{value}}% available on {{${var.alert_by}.name}} )"
  recovery_message = "Available disk volume {{device.name}} on ${var.service} Node {{${var.alert_by}.name}} has recovered ( {{device.name}}  has {{value}}% available on {{${var.alert_by}.name}} )"

  # monitor level vars
  enabled              = var.disk_free_percent_enabled
  alerting_enabled     = var.disk_free_percent_alerting_enabled
  warning_threshold    = var.disk_free_percent_warning
  critical_threshold   = var.disk_free_percent_critical
  priority             = min(var.disk_free_percent_priority + var.priority_offset, 5)
  docs                 = var.disk_free_percent_docs
  note                 = var.disk_free_percent_note
  notification_channel = try(coalesce(var.disk_free_percent_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
