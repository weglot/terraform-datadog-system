locals {
  disk_io_wait_filter = coalesce(
    var.disk_io_wait_filter_override,
    var.filter_str
  )
}

module "disk_io_wait" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.4"

  name  = "System - Disk IO Wait"
  query = "avg(${var.disk_io_wait_evaluation_period}):avg:system.cpu.iowait{${local.disk_io_wait_filter}} by {host} > ${var.disk_io_wait_critical}"

  enabled          = var.disk_io_wait_enabled
  alerting_enabled = var.disk_io_wait_alerting_enabled

  alert_message    = "High IO waits for CPU on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "IO waits for CPU on ${var.service} Node {{host.name}} Recovered ({{value}} %) "

  service         = var.service
  env             = var.alert_env
  priority        = var.disk_io_wait_priority
  severity        = var.disk_io_wait_severity
  note            = var.disk_io_wait_note
  docs            = var.disk_io_wait_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.disk_io_wait_critical
  warning_threshold  = var.disk_io_wait_warning
}
