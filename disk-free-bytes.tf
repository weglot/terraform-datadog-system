locals {
  disk_free_bytes_filter = coalesce(
    var.disk_free_bytes_filter_override,
    var.filter_str
  )
}

module "disk_free_bytes" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name             = "System - Disk Free (bytes)"
  query            = "avg(${var.disk_free_bytes_evaluation_period}):min:system.disk.free{${local.disk_free_bytes_filter}} by {host,device} < ${var.disk_free_bytes_critical}"
  alert_message    = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has dropped below {{threshold}} ( {{device.name}}  has {{value}}% available on {{host.name}} )"
  recovery_message = "Available disk volume {{device.name}} on ${var.service} Node {{host.name}} has recovered ( {{device.name}}  has {{value}}% available on {{host.name}} )"

  # monitor level vars
  enabled              = var.disk_free_bytes_enabled
  alerting_enabled     = var.disk_free_bytes_alerting_enabled
  warning_threshold    = var.disk_free_bytes_warning
  critical_threshold   = var.disk_free_bytes_critical
  priority             = min(var.disk_free_bytes_priority + var.priority_offset, 5)
  docs                 = var.disk_free_bytes_docs
  note                 = var.disk_free_bytes_note
  notification_channel = try(coalesce(var.disk_free_bytes_notification_channel_override, var.notification_channel), "")

  # module level vars
  env             = var.env
  service         = var.service
  additional_tags = var.additional_tags
  locked          = var.locked
  name_prefix     = var.name_prefix
  name_suffix     = var.name_suffix
}
