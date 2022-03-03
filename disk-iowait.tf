locals {
  disk_io_wait_filter = coalesce(
    var.disk_io_wait_filter_override,
    var.filter_str
  )
}

module "disk_io_wait" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name             = "System - Disk IO Wait"
  query            = "avg(${var.disk_io_wait_evaluation_period}):avg:system.cpu.iowait{${local.disk_io_wait_filter}} by {${var.alert_by}} > ${var.disk_io_wait_critical}"
  alert_message    = "High IO waits for CPU on ${var.service} Node {{${var.alert_by}.name}} ({{value}} %)"
  recovery_message = "IO waits for CPU on ${var.service} Node {{${var.alert_by}.name}} Recovered ({{value}} %) "

  # monitor level vars
  enabled              = var.disk_io_wait_enabled
  alerting_enabled     = var.disk_io_wait_alerting_enabled
  warning_threshold    = var.disk_io_wait_warning
  critical_threshold   = var.disk_io_wait_critical
  priority             = min(var.disk_io_wait_priority + var.priority_offset, 5)
  docs                 = var.disk_io_wait_docs
  note                 = var.disk_io_wait_note
  notification_channel = try(coalesce(var.disk_io_wait_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
