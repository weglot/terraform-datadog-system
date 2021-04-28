locals {
  disk_io_wait_filter = coalesce(
    var.disk_io_wait_filter_override,
    var.filter_str
  )
}

module "disk_io_wait" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5.3"

  name             = "System - Disk IO Wait"
  query            = "avg(${var.disk_io_wait_evaluation_period}):avg:system.disk_io_wait.iowait{${local.disk_io_wait_filter}} by {host} > ${var.disk_io_wait_critical}"
  alert_message    = "High IO waits for disk_io_wait on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "IO waits for disk_io_wait on ${var.service} Node {{host.name}} Recovered ({{value}} %) "

  # module level vars
  env                  = var.alert_env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked

  # monitor level vars
  enabled            = var.disk_io_wait_enabled
  alerting_enabled   = var.disk_io_wait_alerting_enabled
  warning_threshold  = var.disk_io_wait_warning
  critical_threshold = var.disk_io_wait_critical
  priority           = var.disk_io_wait_priority
  severity           = var.disk_io_wait_severity
  docs               = var.disk_io_wait_docs
  note               = var.disk_io_wait_note
  name_prefix        = var.disk_io_wait_name_prefix
  name_suffix        = var.disk_io_wait_name_suffix
}
