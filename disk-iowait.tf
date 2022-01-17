locals {
  disk_io_wait_filter = coalesce(
    var.disk_io_wait_filter_override,
    var.filter_str
  )
}

module "disk_io_wait" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "System - Disk IO Wait"
  query            = "avg(${var.disk_io_wait_evaluation_period}):avg:system.cpu.iowait{${local.disk_io_wait_filter}} by {host} > ${var.disk_io_wait_critical}"
  alert_message    = "High IO waits for CPU on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "IO waits for CPU on ${var.service} Node {{host.name}} Recovered ({{value}} %) "

  # monitor level vars
  enabled            = var.disk_io_wait_enabled
  alerting_enabled   = var.disk_io_wait_alerting_enabled
  warning_threshold  = var.disk_io_wait_warning
  critical_threshold = var.disk_io_wait_critical
  priority           = var.disk_io_wait_priority + var.priority_offset
  docs               = var.disk_io_wait_docs
  note               = var.disk_io_wait_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
